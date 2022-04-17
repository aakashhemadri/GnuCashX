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
- [Development](#development)
  - [Setup your environment](#setup-your-environment)
  - [Run all tests](#run-all-tests)
  - [Build the application](#build-the-application)
- [Contributors](#contributors)
- [License](#license)

## Introduction

The purpose of GnuCashX is to be true to the exisiting [GnuCash](https://www.gnucash.org/) application currently in development and to have 1:1 feature parity with GnuCash. Though our app has no relationship to the GnuCash project and shares nothing more than the name, we intend to be 100% interoperable to the `.gnucash` format and support all export types as found in GnuCash

## Installation

You can visit [releases](https://github.com/aakashhemadri/GnuCashX/releases) to download the latest built binaries.

## Development

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

## License

GnuCash is licensed under the MIT License. See [LICENSE](LICENSE) for more information.
