import UIKit

print("Closures")

func outterFunction() -> () -> Void {
    var tmpA = 1
    func innerFunction() {
        tmpA += 1
        print("inside innder function, the value is \(tmpA)")
    }
    tmpA = 10
    return innerFunction
}

let f: () -> Void = outterFunction()
f()

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by: {(s1: String, s2: String) -> Bool in
    return s1 > s2
})

reversedNames = names.sorted(by: { s1, s2 in s2 > s1 })

reversedNames = names.sorted(by: { $0 > $1 })

reversedNames = names.sorted() {
    $1 > $0
}

reversedNames = names.sorted { $0 > $1 }

let digitNames = [0: "Zero", 1: "One", 2:"Two", 3:"Three", 4:"Four", 5:"Five", 6:"Six", 7:"Seven", 8:"Eight", 9:"Nine"]
let numbers = [16, 58, 510]

let strings = numbers.map { (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount  // captcure reference of `runningTotal`
        return runningTotal
    }
    return incrementer
}

let incFuncA: () -> Int = makeIncrementer(forIncrement: 5)
let incFuncB: () -> Int = makeIncrementer(forIncrement: 7)

incFuncA()
incFuncA()

incFuncB()
incFuncA()

incFuncB()
incFuncB()

let incFuncC: () -> Int = makeIncrementer(forIncrement: 5)
let incFuncD: () -> Int = incFuncA

incFuncC()
incFuncA()
incFuncD()

var completionHandlers: [() -> Void] = []

func someFunctionWithEscapeClosure(completionHandler:@escaping () -> Void) {
    completionHandlers.append(completionHandler)
}
    
func someFunctionWithNonescapeClosure(closure: () -> Void) {
    closure()
}

class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapeClosure {
            self.x = 100
        }
        someFunctionWithNonescapeClosure {
            x = 200
        }
    }
}

let instnace = SomeClass()
instnace.doSomething()
print(instnace.x)

