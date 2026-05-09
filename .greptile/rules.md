# Project Conventions for Code Review

## Project status
Greenfield, unreleased. **No backward compatibility.** When renaming/restructuring, update every call site and test in the same change.

## Architecture split
- `Sources/*Core/` — reusable business logic
- `Sources/*CLI/` — executable parsing & terminal output
- `Apps/` — SwiftUI app code

## Swift conventions
- Use Swift Package Manager as the dependency source of truth
- Codable value types for config and data models
- Explicit error handling — avoid force unwraps (`!`) and force tries (`try!`) outside tests
- Generated Xcode projects/workspaces are not in source control (regenerated via Tuist)
- **Swift 6.2 type-checker pitfall:** Avoid inline literals mixing multiple sorted-dictionary `.map{...}.joined()` chains. Pre-bind each chain to a typed `[String]`.

## Security
- **Always redact** keys, tokens, and secrets in displayed configuration

## Out of scope for review
- Style/formatting (handled by `swift-format`)
- Generated dirs: `.build/`, `DerivedData/`, `Derived/`, `*.xcodeproj/`, `*.xcworkspace/`
- `Package.resolved`
- Throwaway dirs: `out/`, `tmp/`, `scratch/`
