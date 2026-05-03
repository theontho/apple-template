import ProjectDescription

let organizationName = "theontho"
let bundlePrefix = "com.example"
let marketingVersion = "0.1.0"
let buildVersion = "1"

let baseSettings: SettingsDictionary = [
  "CURRENT_PROJECT_VERSION": .string(buildVersion),
  "DEVELOPMENT_TEAM": "",
  "ENABLE_USER_SCRIPT_SANDBOXING": "YES",
  "MARKETING_VERSION": .string(marketingVersion),
  "SWIFT_STRICT_CONCURRENCY": "complete",
  "SWIFT_VERSION": "6.0",
]

let appInfoPlist: InfoPlist = .extendingDefault(with: [
  "CFBundleDisplayName": "Apple Template",
  "UILaunchScreen": [:],
])

let coreDependency: TargetDependency = .package(product: "AppleTemplateCore")

let project = Project(
  name: "AppleTemplate",
  organizationName: organizationName,
  options: .options(
    automaticSchemesOptions: .disabled,
    developmentRegion: "en",
    textSettings: .textSettings(usesTabs: false, indentWidth: 2, tabWidth: 2)
  ),
  packages: [
    .package(path: ".")
  ],
  settings: .settings(base: baseSettings),
  targets: [
    .target(
      name: "AppleTemplateiOS",
      destinations: [.iPhone, .iPad],
      product: .app,
      productName: "AppleTemplate",
      bundleId: "\(bundlePrefix).apple-template.ios",
      deploymentTargets: .iOS("17.0"),
      infoPlist: appInfoPlist,
      sources: [
        "Apps/iOS/**/*.swift",
        "Apps/Shared/**/*.swift",
      ],
      dependencies: [coreDependency],
      settings: .settings(base: [
        "CODE_SIGN_STYLE": "Automatic",
        "TARGETED_DEVICE_FAMILY": "1,2",
      ])
    ),
    .target(
      name: "AppleTemplateMac",
      destinations: [.mac],
      product: .app,
      productName: "AppleTemplate",
      bundleId: "\(bundlePrefix).apple-template.mac",
      deploymentTargets: .macOS("14.0"),
      infoPlist: appInfoPlist,
      sources: [
        "Apps/macOS/**/*.swift",
        "Apps/Shared/**/*.swift",
      ],
      dependencies: [coreDependency],
      settings: .settings(base: [
        "CODE_SIGN_STYLE": "Automatic"
      ])
    ),
  ],
  schemes: [
    .scheme(
      name: "AppleTemplateiOS",
      shared: true,
      buildAction: .buildAction(targets: ["AppleTemplateiOS"]),
      runAction: .runAction(executable: .executable("AppleTemplateiOS")),
      archiveAction: .archiveAction(configuration: .release)
    ),
    .scheme(
      name: "AppleTemplateMac",
      shared: true,
      buildAction: .buildAction(targets: ["AppleTemplateMac"]),
      runAction: .runAction(executable: .executable("AppleTemplateMac")),
      archiveAction: .archiveAction(configuration: .release)
    ),
  ]
)
