<h1 align="center">
    GnuCashX
</h1>

<p align="center">
  <a href="https://github.com/aakashhemadri/GnuCashX/releases"><img src="https://img.shields.io/github/release/aakashhemadri/GnuCashX.svg"></a>
  <a href="https://github.com/aakashhemadri/GnuCashX/releases"><img alt="GitHub All Releases" src="https://img.shields.io/github/downloads/aakashhemadri/GnuCashX/total" /></a>
  <a href="https://github.com/aakashhemadri/GnuCashX/blob/master/LICENSE"><img src="https://img.shields.io/github/license/aakashhemadri/GnuCashX.svg"></a>
  <a href="https://github.com/aakashhemadri/GnuCashX/actions/workflows/ci.yml"><img src="https://github.com/aakashhemadri/GnuCashX/workflows/CI/badge.svg?branch=master&event=push" /></a>
  <a href="https://github.com/aakashhemadri/GnuCashX/actions/workflows/linter.yml"><img src="https://github.com/aakashhemadri/GnuCashX/workflows/Linter/badge.svg" /></a>
</p>

**[Documentation](https://github.com/aakashhemadri/GnuCashX/wiki/) | [Installation](#installation) | [Development](#development) | [Contributors](#contributors) | [License](#license)**

<h2> Table of Contents </h2>

- [Introduction](#introduction)
- [Installation](#installation)
  - [GitHub Releases](#github-releases)
  - [Web App](#web-app)
  - [Android & iOS App Stores](#android--ios-app-stores)
- [Contributing to GnuCashX!](#contributing-to-gnucashx)
- [Development](#development)
  - [Setup your environment](#setup-your-environment)
  - [Setup git hooks](#setup-git-hooks)
  - [Prepare flutter](#prepare-flutter)
  - [Generate freezed code](#generate-freezed-code)
  - [Run all tests](#run-all-tests)
  - [Developing with hot-reload](#developing-with-hot-reload)
  - [Debug with performance profiling](#debug-with-performance-profiling)
  - [Build the application for different platforms](#build-the-application-for-different-platforms)
  - [Build API documentation](#build-api-documentation)
  - [Makefile & Helpers](#makefile--helpers)
- [Contributors](#contributors)
- [License](#license)

## Introduction

The purpose of GnuCashX is to be true to the exisiting [GnuCash](https://www.gnucash.org/) application currently in development and to have 1:1 feature parity with GnuCash. Though our app has no relationship to the GnuCash project and shares nothing more than the name, we intend to be 100% interoperable to the `.gnucash` format and support all export types as found in GnuCash

## Installation

### GitHub Releases

You can visit [releases](https://github.com/aakashhemadri/GnuCashX/releases) to download the latest built binaries.

### Web App

Visit the  [stable](https://gnucashx.aakashhemadri.com/app/stable) version of the app built against the latest tagged release or the [latest](https://gnucashx.aakashhemadri.com/app/latest) version of the app built against the `master` branch.

### Android & iOS App Stores

In the works, not a priority until we have a decent app. Help us get there by [contributing](CONTRIBUTING.md).

## Contributing to GnuCashX!

Check out [CONTRIBUTING.md](CONTRIBUTING.md) to help this project

## Development

### Setup your environment

You may open this project on your favourite IDE that supports Flutter through a plugin extension.

If you are confused you can pick using VSCode with the flutter extension or use Android Studio with Flutter plugin installed. If you have the flutter-sdk and dart-sdk you can directly run the below commands to build this app.

### Setup git hooks

```bash
# Setup git hooks
git config core.hooksPath hooks/
```

### Prepare flutter

```bash
# Disable analytics
flutter config --no-analytics
```

```bash
# Download dependencies
flutter pub get
```

### Generate freezed code

```bash
# Generate freezed code
flutter pub run build_runner build --delete-conflicting-outputs
```

### Run all tests

```bash
flutter test
```

### Developing with hot-reload

```bash
# Runs you're app on debug mode on a connected device
flutter run 
```

### Debug with performance profiling

```bash
# Runs you're app in profile mode on a connected device
flutter run --profile
```

### Build the application for different platforms

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

### Build API documentation

```bash
# Allow dartdoc to be run globally 
flutter pub global activate dartdoc 
```

```bash
# Render docs to doc/api
flutter pub global run dartdoc .
```

### Makefile & Helpers

A lot of the above steps have been implemented in this [Makefile](Makefile). You'll need to have `make` installed on your machine. To know more visit [GNU Make](https://www.gnu.org/software/make/)

## Contributors

- [Aakash Hemadri](https://portal.aakashhemadri.com)
- [Niteshkumar S](https://niteshkumar2000.github.io/portfolio)
- [Jeivardan Venkatesulu](https://jeivardan.tech)

## License

GnuCashX is licensed under the GPLv2 License. See [LICENSE](LICENSE) for more information.
