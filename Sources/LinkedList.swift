// Following tutorial at:
// https://airspeedvelocity.net/2015/07/26/linked-lists-enums-value-types-and-identity/
// with additions and updates for Swift 3
enum List<Element> {
	case End
	indirect case Node(Element, next: List<Element>)
}

extension List {
	func cons(_ x: Element) -> List {
		return .Node(x, next: self)
	}
}

extension List {

    init() {
        self = .End
    }

	mutating func push(_ x: Element) {
		self = self.cons(x)
	}

	mutating func pop() -> Element? {
		switch self {
			case .End: return nil
		case let .Node(x, next: xs):
			self = xs
			return x
		}
	}
}

extension List: Sequence, IteratorProtocol {

    /// Returns an iterator over the elements of this sequence.
    func makeIterator() -> AnyIterator<Element> {
        var current = self
        return Iterator {
            // next() will pop, returning nil
            // when the list is empty:
            current.pop()
        }
	}
    func next() -> Element? {
        // declare a variable to capture that
        //  tracks progression through the list:
        var current = self
        return current.pop()
    }
}

extension List: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: Element...) {
        self = elements.reversed().reduce(.End) {
            $0.cons($1)
        }
    }
}
