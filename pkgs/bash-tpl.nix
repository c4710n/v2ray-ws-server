{ pkgs, ... }:
let
  inherit (pkgs) lib stdenv fetchFromGitHub;

  pname = "bash-tpl";
  version = "0.7.1";
in
stdenv.mkDerivation {
  inherit pname version;

  src = fetchFromGitHub {
    owner = "TekWizely";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-psUgUj2dieSINTapblMeDYZcD+GAFRl+9wfZnieMffQ=";
  };

  installPhase = ''
    install -Dm755 -t $out/bin bash-tpl

    substituteInPlace "$out/bin/bash-tpl" \
      --replace "/usr/bin/env bash" "${stdenv.shell}"
  '';

  meta = with lib; {
    description = "A smart, lightweight shell script templating engine, written in Bash";
    homepage = "https://github.com/TekWizely/bash-tpl";
    license = licenses.mit;
    platforms = platforms.linux ++ platforms.darwin;
  };
}
