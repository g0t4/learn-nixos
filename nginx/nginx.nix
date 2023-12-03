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

  # FYI official nixpkgs.nginx derivation:
  # - https://github.com/NixOS/nixpkgs/blob/master/pkgs/servers/http/nginx/generic.nix

  # nginx docs:
  # - compile guide:
  #     https://docs.nginx.com/nginx/admin-guide/installing-nginx/installing-nginx-open-source/#sources
  # - configure options:
  #     https://nginx.org/en/docs/configure.html
  #     FYI:   ./result/bin/nginx -V
  configureFlags = [
    "--with-debug"
  ];
  #     FYI nix sets prefix to nix store:  `--prefix=/nix/store/q6hd7knr2zrnn47sbyr07qm5yqzbz9j2-nginx`

  ## RUN:
  #   ./result/bin/nginx
  #         OR  ./result/bin/nginx -g "daemon off;"
  #   ./result/bin/nginx -s stop
  #   ./result/bin/nginx -s reload

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
