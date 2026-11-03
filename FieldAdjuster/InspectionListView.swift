import SwiftUI

struct InspectionListView: View {
    @Environment(InspectionStore.self) private var store

    var body: some View {
        NavigationStack {
            List(store.inspections) { inspection in
                NavigationLink(value: inspection.id) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(inspection.claimID).font(.headline)
                        Text(inspection.address).font(.subheadline).foregroundStyle(.secondary)
                    }
                }
                .accessibilityIdentifier("inspection-\(inspection.claimID)")
            }
            .navigationTitle("Inspections")
            .navigationDestination(for: String.self) { EstimateView(inspectionID: $0) }
        }
    }
}
