#!/usr/bin/env nix-shell
#! nix-shell -i bash --pure
#! nix-shell -p bash cacert curl jq

curl -s https://mcr.microsoft.com/v2/_catalog | jq .
