# default.nix
let pkgs = import <nixpkgs> { };
in {
  nginx = pkgs.callPackage ./nginx.nix { };
}
