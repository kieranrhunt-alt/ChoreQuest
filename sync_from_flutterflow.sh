#!/usr/bin/env bash
# Refreshes this repo with the latest code FlutterFlow generated for ChoreQuest,
# keeping the repo's own files (codemagic.yaml, .gitignore, .gitattributes and
# this script). Run from the workspace root after any push from the FlutterFlow
# AI workspace (or `flutterflow ai codegen refresh`):
#
#   bash chorequest-app/sync_from_flutterflow.sh
#   cd chorequest-app && git add -A && git commit -m "Sync from FlutterFlow" && git push
set -euo pipefail
here="$(cd "$(dirname "$0")" && pwd)"
src="$here/../generated_code"
[ -d "$src/lib" ] || { echo "generated_code/ not found next to this repo" >&2; exit 1; }
find "$here" -mindepth 1 -maxdepth 1 \
  ! -name .git ! -name .gitignore ! -name .gitattributes \
  ! -name codemagic.yaml ! -name sync_from_flutterflow.sh \
  -exec rm -rf {} +
(cd "$src" && tar --exclude=./.gitignore --exclude=.dart_tool --exclude=build --exclude=.flutterflow \
  --exclude=.flutter-plugins-dependencies --exclude=.flutter-plugins --exclude=ephemeral -cf - .) | (cd "$here" && tar -xf -)
echo "Synced generated code into $here"
