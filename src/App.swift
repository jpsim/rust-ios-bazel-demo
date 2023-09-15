import RustCWrapper
import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

func generateName() -> String {
    String(cString: rust_generate_name())
}

struct ContentView: View {
    @State var rows: [String] = [generateName()]

    var body: some View {
        NavigationView {
            List {
                ForEach(Array(rows.enumerated()), id: \.offset) { _, row in
                    Text(row)
                }
            }
            .navigationBarTitle("Fun Names")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button(action: {
                    withAnimation {
                        rows.append(generateName())
                    }
                }) {
                    Image(systemName: "plus")
                }
            }
        }
    }
}
