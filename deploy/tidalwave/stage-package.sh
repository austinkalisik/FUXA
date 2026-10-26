#!/usr/bin/env bash
set -euo pipefail
repo=$(cd "$(dirname "$0")/../.." && pwd)
target=${1:?Usage: stage-package.sh NEW_OUTPUT_DIRECTORY}
test ! -e "$target" || { echo 'Use a new output directory.' >&2; exit 1; }
mkdir -p "$target"
cp "$repo/client/dist/index.html" "$target/dist-index.html"
cp "$repo/client/src/index.html" "$target/source-index.html"
cp "$repo/client/dist/assets/branding/"* "$target/"
cp "$repo/client/dist/services.html" "$repo/client/dist/brand-preview.html" "$target/"
cp "$repo/deploy/tidalwave/apply-branding.sh" "$repo/deploy/tidalwave/patch-startup.cjs" "$repo/deploy/tidalwave/HANDOVER.md" "$target/"
echo "Staged static branding at $target. Review the compiled index against the target FUXA image before applying."
