import Foundation
import Observation

struct LineItem: Identifiable, Hashable {
    let id: String
    var description: String
    var amountCents: Int
}

struct Inspection: Identifiable, Hashable {
    let id: String
    var claimID: String
    var address: String
    var lineItems: [LineItem]
    var photoCount: Int = 0

    var totalCents: Int { lineItems.reduce(0) { $0 + $1.amountCents } }
}

@Observable
final class InspectionStore {
    var inspections: [Inspection] = [
        Inspection(id: "INS-301", claimID: "CLM-1007", address: "412 Alder St, Portland", lineItems: [
            LineItem(id: "roof", description: "Roof shingles", amountCents: 420_000),
            LineItem(id: "gutter", description: "Gutter repair", amountCents: 65_000),
        ]),
        Inspection(id: "INS-302", claimID: "CLM-2004", address: "88 Harbor Rd, Seattle", lineItems: [
            LineItem(id: "drywall", description: "Drywall", amountCents: 310_000),
            LineItem(id: "flooring", description: "Flooring", amountCents: 540_000),
            LineItem(id: "dryout", description: "Water extraction", amountCents: 120_000),
        ]),
    ]

    func addPhoto(to inspectionID: String) {
        guard let index = inspections.firstIndex(where: { $0.id == inspectionID }) else { return }
        inspections[index].photoCount += 1
    }

    func removeLineItem(_ itemID: String, from inspectionID: String) {
        guard let index = inspections.firstIndex(where: { $0.id == inspectionID }) else { return }
        inspections[index].lineItems.removeAll { $0.id == itemID }
    }
}
