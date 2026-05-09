import ProjectDescription

let tuist = Tuist(
  project: .tuist(
    compatibleXcodeVersions: .all,
    generationOptions: .options(
      buildInsightsDisabled: true,
      testInsightsDisabled: true,
      warningsAsErrors: .all,
      defaultSwiftVersion: "6.0"
    ),
    cacheOptions: .options(keepSourceTargets: true, storages: [.local])
  )
)
