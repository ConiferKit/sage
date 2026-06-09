#!/bin/sh
# Sage — macOS installer.
#
#   curl -fsSL https://conifer.build/install.sh | sh
#
# Downloads the latest build, installs it to /Applications, clears the
# unsigned-build quarantine flag (so Gatekeeper won't say "damaged"), and opens
# it. Nothing leaves your machine. View this script before running it — that's
# the whole point of it being a plain file.
set -e

# Release asset (stable, version-less permalink). Update the repo at launch.
DMG_URL="https://github.com/ConiferKit/sage/releases/latest/download/Sage_universal.dmg"
DMG="$HOME/Downloads/Sage.dmg"

printf '\n  🌲 Installing Sage…\n\n'

echo "  → downloading"
curl -fL -o "$DMG" "$DMG_URL"

# Eject any leftover Sage mounts from a previous run (find = no shell-glob errors).
find /Volumes -maxdepth 1 -name 'Sage*' 2>/dev/null | while read -r v; do
  hdiutil detach "$v" -force >/dev/null 2>&1 || true
done

echo "  → mounting"
MNT=$(hdiutil attach -nobrowse "$DMG" | grep -o '/Volumes/.*')

echo "  → copying to /Applications"
cp -R "$MNT/Sage.app" /Applications/
hdiutil detach "$MNT" >/dev/null

# Unsigned build: strip quarantine so it opens without the "damaged" prompt.
xattr -dr com.apple.quarantine /Applications/Sage.app 2>/dev/null || true

printf '\n  ✓ Done — opening Sage.\n\n'
open /Applications/Sage.app
