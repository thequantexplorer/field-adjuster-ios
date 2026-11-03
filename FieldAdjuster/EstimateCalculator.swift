import Foundation

enum EstimateCalculator {
    /// Average cost per line item, shown on the estimate summary.
    static func averageItemCents(totalCents: Int, itemCount: Int) -> Int {
        totalCents / itemCount
    }

    static func format(cents: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "USD"
        return formatter.string(from: NSNumber(value: Double(cents) / 100)) ?? "$0.00"
    }
}
