{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:nixos/nixpkgs/release-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, flake-utils, home-manager, nixpkgs }: flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = nixpkgs.legacyPackages.${system};
      hm = home-manager.packages.${system}.default;
    in
    {
      apps =
        let
          switch = pkgs.writeShellScript "build.sh" ''
            ${hm}/bin/home-manager switch --flake . --impure
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
          hm
          pkgs.stylua
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
