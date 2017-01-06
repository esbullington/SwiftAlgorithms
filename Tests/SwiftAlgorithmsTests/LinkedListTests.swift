import XCTest
@testable import SwiftAlgorithms

class LinkedListTests: XCTestCase {

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        var stack: List<Int> = List()
        stack.push(1)
        stack.push(2)
        stack.push(3)
        let top = stack.pop()
        XCTAssertEqual(top, 3)
    }

    func testSequence() {
        var stack: List<Int> = List()
        stack.push(1)
        stack.push(2)
        stack.push(3)
        var someInts = [Int]()
        for elem in stack {
            someInts.append(elem)
        }
        XCTAssertEqual(someInts[0], 3)
        XCTAssertEqual(someInts[1], 2)
        XCTAssertEqual(someInts[2], 1)
    }

    static var allTests : [(String, (LinkedListTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
            ("testSequence", testSequence),
        ]
    }
}
