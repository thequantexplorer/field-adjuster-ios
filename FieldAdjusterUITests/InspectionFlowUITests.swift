import XCTest

final class InspectionFlowUITests: XCTestCase {
    func testOpenEstimate() {
        let app = XCUIApplication()
        app.launch()
        app.buttons["inspection-CLM-1007"].tap()
        XCTAssertTrue(app.staticTexts["average-per-item"].waitForExistence(timeout: 5))
    }
}
