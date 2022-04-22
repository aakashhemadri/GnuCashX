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
	@flutter test

# Lint flutter code
.PHONY: lint
lint: format
	@flutter analyze --fatal-infos --fatal-warnings

# Build target web
.PHONY: build-web
build-web: test
	@flutter build web

# Build api docs @ docs/api
.PHONY: build-docs
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
web: build
	@python -m http.server --directory build/web --bind localhost 10000 2> /dev/null

# Make dartdoc available as a global package, flutter needs this.
activate-docs:
	@flutter pub global activate dartdoc
