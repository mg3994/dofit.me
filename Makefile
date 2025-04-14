.PHONY: help setup clean get generate test test-unit test-coverage test-integration build-ios build-apk build-aab build-web lint analyze run-dev run-prod

# Variables
FLUTTER = flutter
DART = dart
COVERAGE_REPORT = coverage/lcov.info
OUTPUT_DIR = build

# Colors
YELLOW=\033[0;33m
GREEN=\033[0;32m
NO_COLOR=\033[0m

setup:
    $(MAKE) get
    $(MAKE) generate

clean: ## Clean the project
    @echo "Cleaning project..."
    @$(FLUTTER) clean

get: ## Get dependencies
    @echo "Getting dependencies..."
    @$(FLUTTER) pub get

generate: ## Generate code (build_runner, mocks, etc.)
    @echo "Generating code..."
    @$(FLUTTER) pub run build_runner build --delete-conflicting-outputs

watch: ## Watch for changes and generate code
    @echo "Watching for changes..."
    @$(FLUTTER) pub run build_runner watch --delete-conflicting-outputs

test: ## Run all tests
    @echo "Running all tests..."
    @$(FLUTTER) test

test-unit: ## Run unit tests only
    @echo "Running unit tests..."
    @$(FLUTTER) test test/features/

test-coverage: ## Run tests with coverage
    @echo "Running tests with coverage..."
    @$(FLUTTER) test --coverage
    @lcov --remove $(COVERAGE_REPORT) "lib/generated/*" "lib/*/*.g.dart" -o $(COVERAGE_REPORT)
    @genhtml $(COVERAGE_REPORT) -o coverage/html
    @echo "Coverage report generated at coverage/html/index.html"

test-integration: ## Run integration tests
    @echo "Running integration tests..."
    @$(FLUTTER) test integration_test/

build-ios: ## Build iOS app
    @echo "Building iOS app..."
    @$(FLUTTER) build ios --release

build-apk: ## Build Android APK
    @echo "Building Android APK..."
    @$(FLUTTER) build apk --release

build-aab: ## Build Android App Bundle
    @echo "Building Android App Bundle..."
    @$(FLUTTER) build appbundle --release

lint: ## Lint the code
    @echo "Linting code..."
    @$(DART) format --set-exit-if-changed lib test

analyze: ## Analyze the code
    @echo "Analyzing code..."
    @$(FLUTTER) analyze

run-dev: ## Run the app in development mode
    @echo "Running app in development mode..."
    @$(FLUTTER) run --flavor development --target lib/main_development.dart

run-prod: ## Run the app in production mode
    @echo "Running app in production mode..."
    @$(FLUTTER) run --flavor production --target lib/main_production.dart

ci: ## Run CI tasks (get, analyze, test)
    $(MAKE) get
    $(MAKE) analyze
    $(MAKE) test