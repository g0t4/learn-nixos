{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  packages = with pkgs; [
    bash
    cacert
    curl
    jq
    bat
  ];

  shellHook = ''
    export PS1="\[\033[1;34m\]\w\[\033[0m\] \[\033[1;32m\]\$\[\033[0m\] "
    bat --version
    jq --version
  '';
}