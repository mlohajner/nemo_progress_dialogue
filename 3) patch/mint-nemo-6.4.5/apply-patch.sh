#!/usr/bin/bash
# Applies the Nemo transfer-speed-graph patch to a pristine Nemo 6.4.5 source tree.
#
# Usage:
#   ./apply-patch.sh /path/to/nemo-6.4.5
#
# The target directory must be an *unmodified* checkout/extraction of
# Nemo 6.4.5 (e.g. https://github.com/linuxmint/nemo, tag 6.4.5), with
# the same top-level layout (src/, libnemo-private/, ...).

set -e

if [ -z "$1" ]; then
    echo "Usage: $0 /path/to/nemo-6.4.5"
    exit 1
fi

TARGET="$1"
PATCH_DIR="$(cd "$(dirname "$0")" && pwd)"

if [ ! -d "$TARGET/src" ] || [ ! -d "$TARGET/libnemo-private" ]; then
    echo "error: '$TARGET' does not look like a Nemo source tree (missing src/ or libnemo-private/)"
    exit 1
fi

echo "Checking patch against $TARGET ..."
(cd "$TARGET" && patch -p1 --dry-run < "$PATCH_DIR/nemo-transfer-graph.patch")

echo "Applying patch ..."
(cd "$TARGET" && patch -p1 < "$PATCH_DIR/nemo-transfer-graph.patch")

echo "Installing GSettings schema ..."
sudo cp "$PATCH_DIR/org.nemo.transfer-graph.gschema.xml" /usr/share/glib-2.0/schemas/
sudo glib-compile-schemas /usr/share/glib-2.0/schemas/

echo "Done. You can now build Nemo as usual (meson setup build && ninja -C build)."
