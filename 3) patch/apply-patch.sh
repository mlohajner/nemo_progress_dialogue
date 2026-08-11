#!/usr/bin/bash
# Applies the Nemo transfer-speed-graph patch to the *Fedora* Nemo 6.4.5
# source tree — i.e. the tree Fedora's nemo.spec actually builds from
# (upstream 6.4.5 tarball + Fedora's own remove_desktop_search.patch and
# Don-t-scale-text-size-when-zooming.patch already applied).
#
# This is the project's source of truth. Do NOT apply this patch to a
# plain/pristine upstream (linuxmint/nemo) checkout — Fedora's own
# patches shift some of the same regions and the patch may not apply
# cleanly, or may apply "cleanly" against the wrong baseline.
#
# Usage:
#   ./apply-patch.sh                # builds the Fedora source tree via
#                                    # `rpmbuild -bp` from the nemo.spec
#                                    # + SOURCES shipped in "2) source",
#                                    # then applies the patch to it.
#
#   ./apply-patch.sh /path/to/tree  # apply directly to an already
#                                    # rpmbuild-%prep'd Fedora source tree

set -e

PATCH_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$PATCH_DIR/.." && pwd)"
SOURCE_DIR="$REPO_ROOT/2) source/rpmbuild"

apply_to() {
    local TARGET="$1"
    if [ ! -d "$TARGET/src" ] || [ ! -d "$TARGET/libnemo-private" ]; then
        echo "error: '$TARGET' does not look like a Nemo source tree (missing src/ or libnemo-private/)"
        exit 1
    fi
    echo "Checking patch against $TARGET ..."
    (cd "$TARGET" && patch -p1 --dry-run < "$PATCH_DIR/nemo-transfer-graph.patch")
    echo "Applying patch ..."
    (cd "$TARGET" && patch -p1 < "$PATCH_DIR/nemo-transfer-graph.patch")
}

if [ -n "$1" ]; then
    apply_to "$1"
else
    if ! command -v rpmbuild >/dev/null 2>&1; then
        echo "error: rpmbuild not found. Install rpm-build (Fedora) or the 'rpm' package"
        echo "       (Debian/Ubuntu, provides rpmbuild), or pass an already-prepped"
        echo "       Fedora source tree path as an argument instead."
        exit 1
    fi

    TOPDIR="$(mktemp -d)/rpmbuild"
    mkdir -p "$TOPDIR"/{SOURCES,SPECS,BUILD,BUILDROOT,RPMS,SRPMS}
    cp -r "$SOURCE_DIR/SOURCES/." "$TOPDIR/SOURCES/"
    cp "$SOURCE_DIR/SPECS/nemo.spec" "$TOPDIR/SPECS/nemo.spec"

    echo "Running rpmbuild -bp (Fedora %prep: unpack + apply Fedora's own patches) ..."
    rpmbuild --define "_topdir $TOPDIR" --nodeps -bp "$TOPDIR/SPECS/nemo.spec"

    apply_to "$TOPDIR/BUILD/nemo-6.4.5"

    echo
    echo "Fedora source tree with the transfer-graph patch applied is at:"
    echo "  $TOPDIR/BUILD/nemo-6.4.5"
fi

echo "Installing GSettings schema ..."
sudo cp "$PATCH_DIR/org.nemo.transfer-graph.gschema.xml" /usr/share/glib-2.0/schemas/
sudo glib-compile-schemas /usr/share/glib-2.0/schemas/

echo "Done. Build with meson as usual (meson setup build && ninja -C build)."
