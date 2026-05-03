import AppleTemplateCore
import SwiftUI

struct ContentView: View {
  let platformName: String
  private let config = AppConfig()

  var body: some View {
    NavigationStack {
      VStack(alignment: .leading, spacing: 18) {
        Text("Apple Template")
          .font(.largeTitle.bold())

        Text("A SwiftUI starter for iOS, macOS, and Swift command-line tools.")
          .font(.title3)
          .foregroundStyle(.secondary)

        LabeledContent("Platform", value: platformName)
        LabeledContent("Log Level", value: config.logLevel.rawValue)
        LabeledContent("Data Directory", value: config.dataDirectory)
          .font(.callout.monospaced())
      }
      .padding(28)
      .frame(maxWidth: 680, alignment: .leading)
      .navigationTitle("Apple Template")
    }
  }
}

#Preview {
  ContentView(platformName: "Preview")
}
