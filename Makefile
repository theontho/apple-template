.PHONY: precheck setup-dev lint format test build-cli run-cli project build-ios build-macos clean

precheck:
	swift run apple-template precheck

setup-dev:
	swift package resolve
	./scripts/tuist.sh install
	swift scripts/dev-register.swift
	swift scripts/setup-hooks.swift

lint:
	swift format lint --recursive Sources Tests Apps scripts Project.swift Tuist.swift

format:
	swift format format --in-place --recursive Sources Tests Apps scripts Project.swift Tuist.swift

test:
	swift test --parallel

build-cli:
	swift build -c release

run-cli:
	swift run apple-template run

project:
	./scripts/tuist.sh generate --no-open

build-ios: project
	xcodebuild -workspace AppleTemplate.xcworkspace -scheme AppleTemplateiOS -destination 'generic/platform=iOS Simulator' build CODE_SIGNING_ALLOWED=NO

build-macos: project
	xcodebuild -workspace AppleTemplate.xcworkspace -scheme AppleTemplateMac build CODE_SIGNING_ALLOWED=NO

clean:
	swift package clean
	rm -rf AppleTemplate.xcodeproj AppleTemplate.xcworkspace Derived DerivedData .build
	rm -rf out/* tmp/*
