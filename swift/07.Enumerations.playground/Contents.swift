
//: # Enumerations

import UIKit

enum CompassPoint {
    case north
    case south
    case east
    case west
}

enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

var directionToHead = CompassPoint.west

directionToHead = .east

switch directionToHead {
case .north:
    print("Lost of planets have a north")
case .south:
    print("Wathc out for penguins")
case .east:
    print("Where the sun rise")
case .west:
    print("Where the skies are blue")
}

let somePlanet:Planet = .earth

switch somePlanet {
case .earth:
    print("Mostly harmless")
default:
    print("Not a safe place for humans")
}

//:## Interating over Enumeration Cases

// CaseIterable

enum Beverage: CaseIterable {
    case coffee, tea, juice
}

let numberOfChoices = Beverage.allCases.count
print("\(numberOfChoices) beverages available")

for beverage in Beverage.allCases {
    print(beverage)
}

// Associated Value

enum barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode = barcode.upc(8, 85909, 51226, 3)
productBarcode = barcode.qrCode("ABCDEFGHIJKLMNOP")

switch productBarcode {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC: \(numberSystem)")
case let .qrCode(productCode):
    print(productCode)
}

// Raw Value

enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

// Implicity assign raw value

enum Planet2: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

enum CompassPointString: String {
    case north, south, east, west
}

print(CompassPointString.west.rawValue)

print(Planet2.earth.rawValue)
let planetMars = Planet2(rawValue: 10)  // the return type is Planet2?

if let planet2 = Planet2(rawValue: 11) {
    switch planet2 {
    case .earth:
        print("Mostly harmless!")
    default:
        print("Somewhere else")
    }
} else {
    print("We havn't found that yet")
}

//: ##Recursive Enumeration

enum ArithmeticExpress {
    case number(Int)
    indirect case addition(ArithmeticExpress, ArithmeticExpress)
    indirect case multiplication(ArithmeticExpress, ArithmeticExpress)
}

let five: ArithmeticExpress = .number(5)
let four: ArithmeticExpress = .number(4)

let sum: ArithmeticExpress = .addition(five, four)
let product = ArithmeticExpress.multiplication(five, four)

func evalute(_ expression: ArithmeticExpress) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evalute(left) + evalute(right)
    case let .multiplication(left, right):
        return evalute(left) * evalute(right)
    }
}

evalute(sum)
evalute(ArithmeticExpress.addition(product, .number(10)))



