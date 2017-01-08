
indirect enum Tree<Element: Comparable> {
	case Empty
	case Node(Element, Tree<Element>, Tree<Element>)

	init() { 
        self = .Empty
    }

	init(_ val: Element, left: Tree<Element> = .Empty, right: Tree<Element> = .Empty)
	{
		self = .Node(val, left, right)
	}
}


extension Tree {
	func contains(_ x: Element) -> Bool {
		guard case let .Node(y, left, right) = self
		else {
			return false
		}
		if x < y {
			return left.contains(x)
		}
		if x > y {
			return right.contains(x)
		}
		if x == y {
            return true
        }
        return true
	}
}


private func ins<Element>(_ into: Tree<Element>, _ x: Element) -> Tree<Element> {
	guard case let .Node(val, l, r) = into
	else { return Tree(x) }

	if x < val { return Tree(val, left: ins(l,x), right: r) }
	if x >= val { return Tree(val, left: l, right: ins(r, x)) }
	return into
}


extension Tree {
	func insert(_ x: Element) -> Tree {
		guard case let .Node(x, l, r) = ins(self, x)
		else { fatalError("ins should never return an empty tree") }

		return .Node(x, l, r)
	}
}

private func aux<Element>(_x: Element, max_value: Int, min_value: Int) {
}

extension Tree {
	func is_binary_tree(_ x: Element) -> Bool {
		guard case let .Node(x, l, r) = ins(self, x)
		else { fatalError("ins should never return an empty tree") }
		return true
	}
}


extension Tree: Sequence {
	func makeIterator() -> AnyIterator<Element> {
		var stack: [Tree] = []
		var current: Tree = self

		return Iterator { _ -> Element? in
			while true {
				// if there's a left-hand node, head down it
				if case let .Node(_,l,_) = current {
					stack.append(current)
					current = l
				}
				// if there isn’t, head back up, going right as
				// soon as you can:
					else if !stack.isEmpty, case let .Node(x,_,r) = stack.removeLast() {
						current = r
						return x
					}
					else {
						// otherwise, we’re done
						return nil
					}
			}
		}
	}
}
