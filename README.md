# GnuCashX
[![ci](https://github.com/aakashhemadri/GnuCashX/actions/workflows/ci.yml/badge.svg?branch=master&event=push)](https://github.com/aakashhemadri/GnuCashX/actions/workflows/ci.yml)
[![linter](https://github.com/aakashhemadri/GnuCashX/actions/workflows/linter.yml/badge.svg?branch=master&event=push)](https://github.com/aakashhemadri/GnuCashX/actions/workflows/linter.yml)

## Download latest release

You can visit [releases](https://github.com/aakashhemadri/GnuCashX/releases) to download the latest built binaries.

## Usage

### Setup your environment

You may open this project on your favourite IDE that supports Flutter through a plugin extension.

If you are confused you can pick using VSCode with the flutter extension or use Android Studio with Flutter plugin installed. If you have the flutter-sdk and dart-sdk you can directly run the below commands to build this app.

```bash
# Disable analytics
flutter config --no-analytics
```

```bash
# Download dependencies
flutter pub get
```

### Run all tests

```bash
flutter test
```

### Build the application

```bash
# Android APK
flutter build apk
```

```bash
# Build web distribution files
flutter build web
```

```bash
# Build for iOS target
flutter build ios --release --no-codesign
```

## Contributors

[Aakash Hemadri](https://portal.aakashhemadri.com)