{
  description = "Elm and Bun development environment";

  # Inputs: Sources for packages
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        # The "devShell" defines what packages are available for `nix develop`
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            # Fish
            fish

            # Elm Tooling
            elmPackages.elm
            elmPackages.elm-format
            elmPackages.elm-language-server
            elmPackages.elm-test
            # Don't know if I'll be using these yet
            elmPackages.elm-doc-preview
            elmPackages.elm-optimize-level-2
          ];

          # Optional: Environment variables exclusive to this shell
          shellHook = ''
            echo "Elm + Bun Dev Environment"
            echo "Elm version: $(elm --version)"
            unset DEVELOPER_DIR
            # Launch fish instead of bash
            exec fish -C '
            # Set up Tide theme
            set -gx tide_pkg_path ${pkgs.fishPlugins.tide}
            source ${pkgs.fishPlugins.tide}/share/fish/vendor_conf.d/tide.fish
            
            # Aliases
            alias extst="exercism test"
            alias exsub="exercism submit"
            
            # Optional: Configure Tide inline
            set -g tide_left_prompt_items pwd git
            set -g tide_right_prompt_items status cmd_duration context jobs
            
            echo "🐟 Exercism dev environment loaded!"
          '
          '';
        };
      }
    );
}
