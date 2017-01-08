import XCTest
@testable import SwiftAlgorithms

class BinarySearchTreeTests: XCTestCase {

    func testInsert() {
        var t: Tree<Int> = Tree()
        t = t.insert(3)
        t = t.insert(3)
        t = t.insert(33)
        var response = t.contains(3)
        XCTAssertEqual(response, true)
        response = t.contains(33)
        XCTAssertEqual(response, true)
        response = t.contains(12)
        XCTAssertEqual(response, false)
    }


    static var allTests : [(String, (BinarySearchTreeTests) -> () throws -> Void)] {
        return [
            ("testInsert", testInsert),
        ]
    }
}
