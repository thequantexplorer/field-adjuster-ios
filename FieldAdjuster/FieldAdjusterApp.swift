import SwiftUI

@main
struct FieldAdjusterApp: App {
    @State private var store = InspectionStore()

    var body: some Scene {
        WindowGroup {
            InspectionListView()
                .environment(store)
        }
    }
}
