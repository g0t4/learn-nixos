FROM nixos/nix

# Install dependencies
RUN nix-env -i silver-searcher grc bat jq fzf nix-index nixpkgs-fmt
# RUN nix-env -iA nixpkgs.mount
# RUN nix-index


# https://nixos.org/manual/nix/stable/command-ref/conf-file.html
# append config to default nix.conf
RUN cat <<EOF >> /etc/nix/nix.conf

experimental-features = nix-command flakes

EOF
# test with:    nix run github:mic92/nix-index-database bin/cntr
