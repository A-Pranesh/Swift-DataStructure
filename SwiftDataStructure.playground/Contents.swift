import UIKit
//
////STACK DATASTRUCTURE
//
//struct Stack<Element> {
//    fileprivate var array: [Element] = []
//    var isEmpty: Bool {
//        return array.isEmpty
//    }
//    var count: Int {
//        return array.count
//    }
//    mutating func push(_ element: Element) {
//        array.append(element)
//    }
//    mutating func pop() -> Element? {
//        return array.popLast()
//    }
//    mutating func peak() -> Element? {
//        return array.last
//    }
//}
//extension Stack: CustomStringConvertible {
//    var description: String {
//        let topDivider = "--Stack-\n"
//        let bottomDivider = "\n------\n"
//        let stackElements = array.map { "\($0)" }.reversed().joined(separator: "\n")
//        return topDivider + stackElements + bottomDivider
//    }
//}
//var rwBookStack = Stack<String>()
//rwBookStack.push("Pranesh")
//rwBookStack.push("Dharani")
//print(rwBookStack)
//var rwBookStack1 = Stack<Int>()
//rwBookStack1.push(31)
//rwBookStack1.push(5)
//print(rwBookStack1)
//
//
//
//// LINKED LIST DATASTRUCTURE
//public class Node<T> {
//    var next: Node<T>?
//    weak var previous: Node<T>?
//    var value: T
//    init(value: T) {
//        self.value = value
//    }
//}
//public class LinkedList<T> {
//    fileprivate var head: Node<T>?
//    private var tail: Node<T>?
//    public var isEmpty: Bool {
//        return head == nil
//    }
//    public var first: Node<T>? {
//        return head
//    }
//    public var last: Node<T>? {
//        return tail
//    }
//    func append(value: T) {
//        let newNode = Node(value: value)
//        if let tailNode = tail {
//            newNode.previous = tailNode
//            tailNode.next = newNode
//        } else {
//            head = newNode
//        }
//        tail = newNode
//    }
//    public func nodeAt(index: Int) -> Node<T>? {
//        if index >= 0 {
//            var node = head
//            var i = index
//            while node != nil {
//                if i == 0 { return node }
//                i -= 1
//                node = node!.next
//            }
//        }
//        return nil
//    }
//    public func removeAll() {
//        head = nil
//        tail = nil
//    }
//    public func remove(node: Node<T>) -> T {
//        let prev = node.previous
//        let next = node.next
//        if let prev = prev {
//            prev.next = next
//        } else {
//            head = next
//        }
//        head?.previous = prev
//        if next == nil {
//            tail = prev
//        }
//        node.previous = nil
//        node.next = nil
//        return node.value
//    }
//}
//extension LinkedList: CustomStringConvertible {
//    public var description: String {
//        var text = "["
//        var node = head
//        while node != nil {
//            text += "\(node!.value)"
//            node = node!.next
//            if node != nil { text += ", " }
//        }
//        return text + "]"
//    }
//}
//let dogBreeds = LinkedList<String>()
//dogBreeds.append(value: "Lab")
//dogBreeds.append(value: "Bull")
//dogBreeds.append(value: "Beagle")
//dogBreeds.append(value: "Husky")
//print(dogBreeds)
//let numbers = LinkedList<Int>()
//numbers.append(value: 5)
//numbers.append(value: 31)
//numbers.append(value: 315)
//numbers.append(value: 531)
//numbers.append(value: 351)
//print(numbers)



// QUEUE DATASTRUCTURE
//public struct Queue<T> {
//    fileprivate var list = LinkedList<T>()
//    public var isEmpty: Bool {
//        return list.isEmpty
//    }
//    public mutating func enqueue(_ element: T) {
//        list.append(value: element)
//    }
//    public mutating func deqeue() -> T? {
//        guard  !list.isEmpty, let element = list.first else { return nil }
//        list.remove(node: element)
//        return element.value
//    }
//    public mutating func peek() -> T? {
//        return list.first?.value
//    }
//}
//
//extension Queue: CustomStringConvertible {
//  public var description: String {
//    return list.description
//  }
//}
//
//
//var queue = Queue<Int>()
//Queue.enqueue(5)
//Queue.enqueue(31)
//Queue.enqueue(351)
//print(queue)


//
////MERGE SORT
//func mergeSort<T: Comparable>(_ array: [T]) -> [T] {
//    guard array.count > 1 else { return array }
//    let middleIndex = array.count / 2
//    let leftArray = mergeSort(Array(array[0..<middleIndex]))
//    let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
//    return merge(leftArray, rightArray)
//}
//
//func merge<T: Comparable>(_ left: [T], _ right: [T]) -> [T] {
//    var leftIndex = 0
//    var rightIndex = 0
//    var orderedArray: [T] = []
//    while leftIndex < left.count && rightIndex < right.count {
//        let leftElement = left[leftIndex]
//        let rightElement = right[rightIndex]
//        if leftElement < rightElement {
//            orderedArray.append(leftElement)
//            leftIndex += 1
//        } else if rightElement < leftElement {
//            orderedArray.append(rightElement)
//            rightIndex += 1
//        } else {
//            orderedArray.append(leftElement)
//            orderedArray.append(rightElement)
//            leftIndex += 1
//            rightIndex += 1
//        }
//    }
//    while leftIndex < left.count {
//        orderedArray.append(left[leftIndex])
//        leftIndex += 1
//    }
//    while rightIndex < right.count {
//        orderedArray.append(right[rightIndex])
//        rightIndex += 1
//    }
//    return orderedArray
//}
//let array = [31 , 5, 531, 351, 315]
//mergeSort(array)


//// BINARY SEARCH TREE DATASTRUCTURE
//enum BinaryTree<T: Comparable> {
//    case empty
//    indirect case node(BinaryTree, T, BinaryTree)
//    var count: Int {
//        switch self {
//            case let .node(left, _, right):
//                return left.count + 1 + right.count
//            case .empty:
//                return 0
//        }
//    }
//    mutating func navieInsert(newValue: T) {
//        guard case .node(var left, let value, var right) = self else {
//            self = .node(.empty, newValue, .empty)
//            return
//        }
//        if newValue < value {
//            left.navieInsert(newValue: newValue)
//        } else {
//            right.navieInsert(newValue: newValue)
//        }
//    }
//    private func newTreeWithInsertedValue(newValue: T) -> BinaryTree {
//        switch self {
//        case .empty:
//            return .node(.empty, newValue, .empty)
//        case let .node(left, value, right):
//            if newValue < value {
//                return .node(left.newTreeWithInsertedValue(newValue: newValue), value, right)
//            } else {
//                return .node(left, value, right.newTreeWithInsertedValue(newValue: newValue))
//            }
//        }
//    }
//    mutating func insert(newValue: T) {
//        self = newTreeWithInsertedValue(newValue: newValue)
//    }
//    func search(searchValue: T) -> BinaryTree? {
//        switch self {
//        case .empty:
//            return nil
//        case let .node(left, value, right):
//            if searchValue == value {
//                return self
//            }
//            if searchValue < value {
//                return left.search(searchValue: searchValue)
//            } else {
//                return right.search(searchValue: searchValue)
//            }
//        }
//    }
//}
//
//extension BinaryTree: CustomStringConvertible {
//  var description: String {
//    switch self {
//    case let .node(left, value, right):
//      return "value: \(value), left = [" + left.description + "], right = [" + right.description + "]"
//    case .empty:
//      return ""
//    }
//  }
//}
//
//var binaryTree: BinaryTree<Int> = .empty
//binaryTree.insert(newValue: 5)
//binaryTree.insert(newValue: 31)
//binaryTree.insert(newValue: 351)
//print(binaryTree)
//
//func traverseInOrder(process: @noescape (T) -> ()) {
//  switch self {
//  case .empty:
//    return
//  case let .node(left, value, right):
//    left.traverseInOrder(process: process)
//    process(value)
//    right.traverseInOrder(process: process)
//  }
//}
//
//func traversePreOrder(process: @noescape (T) -> ()) {
//  switch self {
//  case .empty:
//    return
//  case let .node(left, value, right):
//    process(value)
//    left.traverseInOrder(process: process)
//    right.traverseInOrder(process: process)
//  }
//}
//
//func traversePostOrder(process: @noescape (T) -> ()) {
//  switch self {
//  case .empty:
//    return
//  case let .node(left, value, right):
//    left.traverseInOrder(process: process)
//    right.traverseInOrder(process: process)
//    process(value)
//  }
//}
//binaryTree.search(searchValue: 5)
