{
  description = "v2ray-ws-server";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        bash-tpl = import ./deps/bash-tpl.nix pkgs;
      in
      {
        devShells.default = with pkgs; mkShell {
          buildInputs = [
            bash-tpl
            v2ray
          ];
        };
      }
    );
}
