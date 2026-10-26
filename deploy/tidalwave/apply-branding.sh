#!/usr/bin/env bash
set -euo pipefail
container=${FUXA_CONTAINER:-tidalwave_fuxa}
root=$(cd "$(dirname "$0")" && pwd)
dist=/usr/src/app/FUXA/client/dist
# Copy only the reviewed static assets; leave plant data and credentials intact.
podman exec "$container" mkdir -p "$dist/assets/branding"
podman cp "$root/tidalwave-logo.jpeg" "$container:$dist/assets/branding/tidalwave-logo.jpeg"
podman cp "$root/tidalwave.css" "$container:$dist/assets/branding/tidalwave.css"
podman cp "$root/services.html" "$container:$dist/services.html"
podman cp "$root/brand-preview.html" "$container:$dist/brand-preview.html"
podman cp "$root/dist-index.html" "$container:$dist/index.html.tidalwave-new"
podman exec "$container" mv "$dist/index.html.tidalwave-new" "$dist/index.html"
podman cp "$root/patch-startup.cjs" "$container:/tmp/tidalwave-patch-startup.cjs"
podman exec "$container" node /tmp/tidalwave-patch-startup.cjs "$dist"
echo 'TidalWave static branding applied.'
