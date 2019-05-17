//
//  SP020Generics.swift
//  Practices
//
//  Created by Qingcheng Li on 5/16/19.
//  Copyright © 2019 Qing-Cheng Li. All rights reserved.
//

import UIKit

func swapTwoValue<T>(_ a: inout T, _ b: inout T) {
    let tmp = a
    a = b
    b = tmp
}

private struct Stack<Element: Equatable>: Container {
    var stack = [Element]()
    mutating func push(_ element: Element) {
        stack.append(element)
    }
    mutating func pop() -> Element {
        return stack.removeLast()
    }
    mutating func append(_ item: Element) {
        self.push(item)
    }
    var count: Int {
        return stack.count
    }
    subscript(i: Int) -> Element {
        return stack[i]
    }

}

private extension Stack {
    var topItem: Element? {
        return stack.isEmpty ? nil : stack[stack.count - 1]
    }
}

func findIndex<T: Equatable>(ofString valueToFind: T, in array:[T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

private protocol Container {
    associatedtype Item: Equatable
    mutating func append(_ item:Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

private protocol SuffixableContainer: Container {
    associatedtype Suffix: SuffixableContainer where Suffix.Item == Item
    func suffix(_ size:Int) -> Suffix
}

private func allItemMatch<C1: Container, C2: Container>(_ someContainer: C1, _ anotherContainer: C2) -> Bool where C1.Item == C2.Item {
    if someContainer.count != anotherContainer.count {
        return false
    }
    for i in 0..<someContainer.count {
        if someContainer[i] != anotherContainer[i] {
            return false
        }
    }
    return true
}

private class Person {

}

private class 🇹🇼 {

}

private protocol 🌈 {
    func 👫 () -> Void
    func 👭 () -> Void
    func 👬 () -> Void
}

extension 🇹🇼:🌈 {
    func 👭() {

    }

    func 👬() {

    }

    func 👫 () {
    }
}

class SP020Generics: SPPracticeRunnable {
    func run() {
        var a = 1
        var b = 2
        swapTwoValue(&a, &b)
        print(a)
        print(b)
        var stack = Stack<String>()
        stack.push("A")
        stack.push("B")
        print(stack.pop())
        print(stack.pop())
    }
}
