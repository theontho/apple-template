# Apple Template

A best-practice starter for iOS apps, macOS apps, and Swift command-line tools.

## Features

- **Language:** Swift 6 with Swift Package Manager as the source of truth.
- **CLI:** `swift-argument-parser` with `precheck`, `config`, and `run` subcommands.
- **Apps:** Shared SwiftUI code for iOS and macOS, generated with Tuist.
- **Configuration:** JSON config in platform-standard Application Support paths with validation and redaction.
- **Quality:** `swift-format`, Swift Testing, release builds, app builds, and GitHub Actions CI.
- **Agent Friendly:** Includes `AGENTS.md`, `CLAUDE.md`, and `GEMINI.md` for AI-assisted development.

## Requirements

- Xcode 16 or newer with Swift 6.
- `swift-format`, available through recent Xcode toolchains as `swift format`.
- [Tuist](https://tuist.dev) for app workspace generation: `curl -Ls https://install.tuist.io | bash`.
- Optional: [mise](https://mise.jdx.dev) can install the pinned Tuist version from `.mise.toml`.
- GitHub CLI is optional, but `scripts/dev-register.swift` uses it when available.

## Getting Started

1. Install dependencies:
   ```bash
   swift package resolve
   ```
2. Run precheck:
   ```bash
   swift run apple-template precheck
   ```
3. Initialize config:
   ```bash
   swift run apple-template config init
   ```
4. Set up local development identity and hooks:
   ```bash
   make setup-dev
   ```
5. Run the CLI:
   ```bash
   swift run apple-template run --name Swift
   ```
6. Generate the Xcode workspace:
   ```bash
   make project
   open AppleTemplate.xcworkspace
   ```

## Common Commands

- `make lint`: run `swift-format` lint checks.
- `make format`: format Swift source files in place.
- `make test`: run Swift package tests.
- `make build-cli`: build the release CLI.
- `make build-ios`: generate and build the iOS app for a simulator destination.
- `make build-macos`: generate and build the macOS app.
- `make precheck`: verify the local Apple development environment.

## Configuration

Configuration is stored at:

```text
~/Library/Application Support/apple-template/config.json
```

For isolated tests or scripts, set `APPLE_TEMPLATE_CONFIG_DIR` to override the config directory.

View config:

```bash
swift run apple-template config show
```

Overwrite config with defaults:

```bash
swift run apple-template config init --force
```

## Template Rename Checklist

- Rename the package in `Package.swift`.
- Rename `AppleTemplateCore`, `AppleTemplateCLI`, and app target names if desired.
- Update `AppPaths.appName`, bundle identifiers in `Project.swift`, and CLI command names.
- Replace `com.example` with your real reverse-DNS bundle prefix.
- Update CI scheme names if you rename app targets.

## Git Hooks

Git does not automatically install hooks from a cloned repository. Opt in locally with:

```bash
make setup-dev
```

The installed `pre-commit` hook verifies your `.dev_id` and runs formatting lint. The `pre-push` hook verifies identity, runs tests, and builds the CLI.
