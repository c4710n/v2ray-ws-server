{
  description = "v2ray-ws-server";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};

        bash-tpl = pkgs.callPackage ./pkgs/bash-tpl.nix { };
        v2ray-ws-server = pkgs.callPackage ./pkgs/v2ray-ws-server.nix { inherit bash-tpl; };

        devShell = pkgs.mkShell { buildInputs = [ bash-tpl pkgs.v2ray ]; };
      in
      {
        devShells.default = devShell;

        packages.default = v2ray-ws-server;
        packages.v2ray-ws-server = v2ray-ws-server;

        overlays.default = final: prev: rec {
          bash-tpl = prev.callPackage ./pkgs/bash-tpl.nix { };
          v2ray-ws-server = prev.callPackage ./pkgs/v2ray-ws-server.nix { inherit bash-tpl; };
        };
      }
    );
}
