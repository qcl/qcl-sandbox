import UIKit

func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}

func greetAgain(person: String) -> String {
    return "Hello again, \(person)!"
}

func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
}

greet(person: "Bob", alreadyGreeted: false)
greet(person: "Alice", alreadyGreeted: true)

func printAndCount(string: String) -> Int {
    print(string)
    return string.count
}

func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string)
}

printAndCount(string: "Hello, world")
printWithoutCounting(string: "Hello, world")

/// MARK: Function with multiple return values

func minMax(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty {
        return nil
    }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

if let bounds = minMax(array: [8, -6, 2, 109, 3, 71]) {
    print("min is \(bounds.min), and max is \(bounds.1)")
}

func minMaxEX(array: [Int]) -> (Int, Int)? {
    if let result = minMax(array: array) {
        return (result.min, result.max)
    } else {
        return nil
    }
}

if let bounds2 = minMaxEX(array: [9, 1, 2, 49, -12]) {
    print("min is \(bounds2.0), and max is \(bounds2.1)")
}

func someFunction(argumentLabel parameterName: Int) {
    print("Use \(parameterName) inside")
}

someFunction(argumentLabel: 1)


func anotherFunction(_ a:Int, bb b:Int, _ c: Int) {
    // Todo
}

anotherFunction(1, bb: 2, 3)

func functionWithDefaultParams(_ firstParam: String = "Default One") {
    print(firstParam)
}

functionWithDefaultParams("Jizz")
functionWithDefaultParams()

func combined(_ items: Any...) -> [Any] {
    var ary = [Any]()
    for item in items {
        ary.append(item)
    }
    return ary
}

let a = combined(1,2,2,3,4,5,6)

var varA = 1
var varB = 2
print(varA, varB)

func swap(_ a: inout Int, _ b: inout Int) {
    let tmp = a
    a = b
    b = tmp
}

swap(&varA, &varB)

print(varA, varB)

func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func multiplyToInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}

var mathFunc: (Int, Int) -> Int = addTwoInts

mathFunc(2,3)

mathFunc = multiplyToInts

mathFunc(2,3)

func chooseStepFunction(backward: Bool) -> (Int) -> Int {

    func stepForward(_ input: Int) -> Int {
        return input + 1
    }

    func stepBackward(_ input: Int) -> Int {
        return input - 1
    }

    return backward ? stepBackward : stepForward
}

var currentValue = -10
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
while currentValue != 0 {
    currentValue = moveNearerToZero(currentValue)
}

