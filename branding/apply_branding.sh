#!/usr/bin/env bash
# Installs the Squishie Chore Adventure launcher icon, Android adaptive icon and
# native splash into the Flutter project. Run from the repo root (Codemagic runs
# it before every build). FlutterFlow's pubspec already configures
# flutter_launcher_icons to read assets/images/*_icon.png.
set -euo pipefail
mkdir -p assets/images
cp branding/app_launcher_icon.png assets/images/app_launcher_icon.png
cp branding/adaptive_background_icon.png assets/images/adaptive_background_icon.png
cp branding/adaptive_foreground_icon.png assets/images/adaptive_foreground_icon.png
flutter pub get
dart run flutter_launcher_icons
flutter pub add --dev flutter_native_splash:2.4.4
dart run flutter_native_splash:create --path=branding/flutter_native_splash.yaml
# The splash images/storyboard are generated now; the package itself is only a
# generator. Remove it so it is not linked into the app (its iOS plugin breaks
# Xcode's Swift Package Manager resolution).
flutter pub remove flutter_native_splash
flutter pub get
echo "Branding applied: launcher icon, adaptive icon, native splash."
