# icat.nix
{ lib, stdenv, fetchFromGitHub, pkgs ? import <nixpkgs> { } }:


stdenv.mkDerivation {
  name = "hello";

  buildInputs = [
    pkgs.imlib2
    pkgs.xorg.libX11
  ];

  src = fetchFromGitHub {
    owner = "atextor";
    repo = "icat";
    rev = "v0.5";
    # nix-prefetch-url --unpack https://github.com/atextor/icat/archive/refs/tags/v0.5.zip
    #   FYI if not unpacked the shasum will be different, we need shasum of unpacked source
    sha256 = "0wyy2ksxp95vnh71ybj1bbmqd5ggp13x3mk37pzr99ljs9awy8ka";
  };
}

## FYI I stumbled on nixfmt tool:
#   nix-env -i nixfmt
#   nixfmt *.nix
