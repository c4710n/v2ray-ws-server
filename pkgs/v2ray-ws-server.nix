{ pkgs, bash-tpl, ... }:

let
  inherit (pkgs) lib stdenv makeWrapper v2ray;

  pname = "v2ray-ws-server";
  version = "1.1.2";
in
stdenv.mkDerivation {
  inherit pname version;

  src = ../src;

  nativeBuildInputs = [ makeWrapper ];

  installPhase = ''
    install -Dm755 -t $out/bin v2ray-ws-server

    substituteInPlace "$out/bin/v2ray-ws-server" \
      --replace "/usr/bin/env bash" "${stdenv.shell}"

    wrapProgram "$out/bin/v2ray-ws-server" \
      --prefix PATH : ${lib.makeBinPath [bash-tpl v2ray]}
  '';

  meta = with lib; {
    description = "Run a WebSocket server of V2ray.";
    license = licenses.mit;
    platforms = platforms.linux ++ platforms.darwin;
  };
}
