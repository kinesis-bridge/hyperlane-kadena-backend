#!/bin/bash
set -euo pipefail

REPO="kinesis-bridge/hyperlane-kadena-backend"
TAG=$1
KEY="B241B06C43FE4D30"

if [ -z "${TAG:-}" ]; then
    echo "Please specify Release tag as first argument"
    exit 1
fi

workdir="$(mktemp -d)"
trap 'rm -rf "$workdir"' EXIT

cd "$workdir"

gh release download "$TAG" -R "$REPO"

for asc in *.asc; do
    [[ -f "$asc" ]] || continue

    f="${asc%.asc}"

    # Vérifie que l'asset correspondant existe
    [[ -f "$f" ]] || continue

    echo "Signing $f"

    gpg \
        --batch \
        --armor \
        --detach-sign \
        --local-user "$KEY" \
        --output "$f.mine.asc" \
        "$f"

    # Concatène l'ancienne et la nouvelle signature
    cat "$asc" "$f.mine.asc" > "$asc.merged"
    mv "$asc.merged" "$asc"
    rm -f "$f.mine.asc"

    # Remplace l'asset .asc de la release
    gh release upload \
        "$TAG" \
        "$asc" \
        -R "$REPO" \
        --clobber
done