
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


