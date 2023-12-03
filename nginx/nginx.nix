{ lib, stdenv, fetchurl, pkgs ? import <nixpkgs> { } }:

stdenv.mkDerivation {
  name = "nginx";

  # PRN use hg to fetch sources
  # https://nixos.org/manual/nixpkgs/stable/#fetchhg
  # hg.nginx.org/nginx
  #  src = fetchhg {
  #    url = "https://hg.nginx.org/nginx";
  #    rev = "release-1.25.3";
  #    sha256 = "s3Zq/2kv8ZAN75lp+lJfQ0CjwNQ9DWMg4AB1GpxCRjI=";
  #  };

  src = fetchurl {
    url = "https://nginx.org/download/nginx-1.25.3.tar.gz";
    hash = "sha256-ZMW5dcooeTnoKDA/qFfSLxQrJR8XgI3+QXM1EtnN7YY=";
  };

  # nginx compilation docs:
  # - configure options:
  #     https://nginx.org/en/docs/configure.html
  # - compile guide:
  #     https://docs.nginx.com/nginx/admin-guide/installing-nginx/installing-nginx-open-source/#sources

  buildInputs = [
    # listed in comile guide:
    pkgs.pcre2
    pkgs.zlib
    pkgs.openssl

    # added to get build to work:
    pkgs.libxcrypt  # crypt.h
    #   FYIs `ag -ig \/crypt\.h /` to find package named libxcrypt!
    #   `nix-locate` should work too...
  ];

}
