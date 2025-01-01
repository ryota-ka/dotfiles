{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:nixos/nixpkgs/release-24.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, flake-utils, home-manager, nixpkgs }: flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      apps =
        let
          switch = pkgs.writeShellScript "build.sh" ''
            home-manager switch --flake . --impure
            nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
          '';
        in
        {
          switch = {
            type = "app";
            program = "${switch}";
          };
        };
      devShells.default = pkgs.mkShell {
        buildInputs = [
          home-manager.packages.${system}.default
        ];
      };
      formatter = pkgs.nixpkgs-fmt;
      hmModule = import ./home.nix;
      legacyPackages = pkgs;
      lib = {
        inherit (home-manager.lib) homeManagerConfiguration;
      };
      packages.homeConfigurations."ryota-ka" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [ ./home.nix ];
      };
    });
}
