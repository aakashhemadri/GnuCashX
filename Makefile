BINARY := gnucashx
NAME := GnuCashX 

# Run app in debug mode with hot-reload
.PHONY: run
run:
	@flutter run

# Format dart
.PHONY: format
format:
	@flutter format .

# Run flutter tests
.PHONY: test
test:
	@flutter test --reporter expanded

# Lint flutter code
.PHONY: lint
lint: format
	@flutter analyze --fatal-infos --fatal-warnings

# Build target web
.PHONY: build-web
build-web: generate-code test
	@flutter build web

# Build api docs @ docs/api
.PHONY: generate-code build-docs
build-docs: lint
	@flutter pub global run dartdoc .

# Build and serve docs @ http://localhost:11000
# Requires python
.PHONY: docs
docs: lint build-docs
	@python -m http.server --directory doc/api --bind localhost 11000 2> /dev/null

# Build and serve web target @ http://localhost:10000
# Requires python
.PHONY: web
web: build-web
	@python -m http.server --directory build/web --bind localhost 10000 2> /dev/null

# Make dartdoc available as a global package, flutter needs this.
.PHONY: activate-docs
activate-docs:
	@flutter pub global activate dartdoc

# Decode .gnucash gzipped xml to plaintext xml 
.PHONY: decode-gzip
decode-gzip:
	@dart run lib/utils/decode_gzip.dart

# Generate serialization code
# https://docs.flutter.dev/development/data-and-backend/json
.PHONY: generate-code
generate-code:
	@flutter pub run build_runner build --delete-conflicting-outputs 

.PHONY: watch-code
watch-code:
	@flutter pub run build_runner watch --delete-conflicting-outputs

.PHONY: activate-dcdg
activate-dcdg:
	@dart pub global activate dcdg

.PHONY: build-dcdg
build-plantuml:
	@dart pub global run dcdg -o resources/design/uml.plantuml