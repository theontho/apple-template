import SwiftUI

@main
struct AppleTemplateMacApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView(platformName: "macOS")
        .frame(minWidth: 560, minHeight: 360)
    }
  }
}
