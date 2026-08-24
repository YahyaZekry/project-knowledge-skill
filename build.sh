#!/usr/bin/env bash
# Rebuild the .skill bundle from skills/.
set -euo pipefail
cd "$(dirname "$0")"
tmp=$(mktemp -d); trap 'rm -rf "$tmp"' EXIT
for dir in skills/*/; do
    name=$(basename "$dir")
    cp -r "$dir" "$tmp/$name"
    rm -f "$name.skill"
    ( cd "$tmp" && zip -q -r "$OLDPWD/$name.skill" "$name" )
    echo "built $name.skill"
done
