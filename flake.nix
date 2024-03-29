{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, home-manager, nixpkgs }:
    let
      system = "aarch64-darwin";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      apps.${system} =
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
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = [
          home-manager.packages.${system}.default
        ];
      };
      hmModule.${system} = import ./home.nix;
      homeConfigurations."ryota-ka" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [ ./home.nix ];
      };
      legacyPackages.${system} = pkgs;
      lib = {
        inherit (home-manager.lib) homeManagerConfiguration;
      };
    };
}
