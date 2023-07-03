import XCTest
@testable import swift_maidenhead
import CoreLocation

struct TestCase {
    let name: String
    let coordinate: CLLocationCoordinate2D
    let locator: String
    
    init(name: String, latitude: CLLocationDegrees, longitude: CLLocationDegrees, locator: String) {
        self.name = name
        self.coordinate = CLLocationCoordinate2D.init(latitude: latitude, longitude: longitude)
        self.locator = locator
    }
}

let testCases = [TestCase(name: "W1AW", latitude: 41.71463, longitude: -72.72713, locator: "FN31pr"),
                 TestCase(name: "Brno", latitude: 49.1951, longitude: 16.6068, locator: "JN89he"),
                 TestCase(name: "Cape Town", latitude: -33.9249, longitude: 18.4241, locator: "JF96fb")
]

final class swift_maidenheadTests: XCTestCase {
    func testMaidenhead() {
        for testCase in testCases {
            let maidenhead = Maidenhead(coordinate: testCase.coordinate)
            XCTAssert(maidenhead.locator == testCase.locator,
                      "expected `\(testCase.locator)`, got `\(maidenhead.locator)`")
        }
    }
}
