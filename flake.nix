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
        deps = [ bash-tpl pkgs.v2ray ];

        devShell = pkgs.mkShell { buildInputs = deps; };
        package = import ./nix/v2ray-ws-server.nix { inherit pkgs deps; };
      in
      {
        devShells.default = devShell;

        packages.default = package;
        packages.v2ray-ws-server = package;
      }
    );
}
