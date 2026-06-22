import SwiftUI
import HTTPClient

public struct ContentView: View {
    public init() {}

    public var body: some View {
        Text("Hello, World!")
            .padding()
            .onAppear {
                Task {
                    await self.testHTTPClient()
                }
            }
    }
    
    func testHTTPClient() async {
        let client = HTTPClient()
        do {
            let data = try await client.get(url: URL(string: "https://httpbin.org/get")!)
            print("Got \(data.count) bytes")
        } catch {
            print("Error: \(error)")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
