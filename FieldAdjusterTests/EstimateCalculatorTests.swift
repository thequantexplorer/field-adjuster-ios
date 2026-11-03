import XCTest
@testable import FieldAdjuster

final class EstimateCalculatorTests: XCTestCase {
    func testAveragePerItem() {
        XCTAssertEqual(EstimateCalculator.averageItemCents(totalCents: 485_000, itemCount: 2), 242_500)
    }
}
