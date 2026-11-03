import SwiftUI

struct EstimateView: View {
    @Environment(InspectionStore.self) private var store
    let inspectionID: String

    private var inspection: Inspection? { store.inspections.first { $0.id == inspectionID } }

    var body: some View {
        if let inspection {
            List {
                Section {
                    VStack(alignment: .leading, spacing: 6) {
                        Text(EstimateCalculator.format(cents: inspection.totalCents))
                            .font(.system(size: 40, weight: .semibold, design: .rounded))
                        Text("Average per item \(EstimateCalculator.format(cents: EstimateCalculator.averageItemCents(totalCents: inspection.totalCents, itemCount: inspection.lineItems.count)))")
                            .foregroundStyle(.secondary)
                            .accessibilityIdentifier("average-per-item")
                    }
                    .padding(.vertical, 8)
                }
                Section("Damage line items") {
                    ForEach(inspection.lineItems) { item in
                        HStack {
                            LabeledContent(item.description, value: EstimateCalculator.format(cents: item.amountCents))
                            Button("Remove", role: .destructive) {
                                store.removeLineItem(item.id, from: inspection.id)
                            }
                            .buttonStyle(.borderless)
                            .accessibilityIdentifier("remove-\(item.id)")
                        }
                    }
                }
            }
            .navigationTitle(inspection.claimID)
        }
    }
}
