import Testing

@testable import AppleTemplateCLI

@Test func runGreetingUsesProvidedName() {
  #expect(Run.greeting(name: "Ada") == "Hello, Ada from apple-template!")
}
