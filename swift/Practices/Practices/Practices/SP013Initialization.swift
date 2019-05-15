//
//  SP013Initialization.swift
//  Practices
//
//  Created by Qingcheng Li on 5/13/19.
//  Copyright © 2019 Qing-Cheng Li. All rights reserved.
//

import UIKit

private class Vehicle {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) wheels"
    }
}

private class Bicycle: Vehicle {
    override init() {
        super.init()
        numberOfWheels = 2
    }
}

// MARK: Designated and Convenience Initializers in Action

private class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}

private class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }

    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}

private class ShoppingListItem: RecipeIngredient {
    var purchased = false
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? "   y" : "   n"
        return output
    }
}

private struct Fahrenheit {
    var tempreature: Double
    init() {
        tempreature = 32.0
    }
}

private struct Celsius {
    var tempreatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        tempreatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin: Double) {
        tempreatureInCelsius = fromKelvin - 273.15
    }
    init(_ celsius: Double) {
        tempreatureInCelsius = celsius
    }
}

private class SurveyQuestion {
    var text: String
    var response: String?
    init(text:String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}

private struct Size {
    var width = 0.0, height = 0.0
}

private struct Point {
    var x = 0.0, y = 0.0
}

private struct Rect {
    var origin = Point()
    var size = Size()
    init () {

    }
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

// NARK: Failable initializer


// MARK: -

class SP013Initialization: NSObject {
    override init() {
    }

    func run() -> Void {
        print("#013 Initialization")

        let f = Fahrenheit()
        print("The default temperature is \(f.tempreature)")

        let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
        let freezingPointOfWater = Celsius(fromKelvin: 273.15)
        let bodyTemp = Celsius(37.0)

        print("\(boilingPointOfWater.tempreatureInCelsius), \(freezingPointOfWater.tempreatureInCelsius), \(bodyTemp.tempreatureInCelsius)")

        let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
        cheeseQuestion.ask()
        cheeseQuestion.response = "Yes, I do like cheese."

//        let twoByTwo = Size(width: 2.0, height: 2.0)
        let bike = Bicycle()
        print(bike.description)

        let nameOfMeat = Food(name: "Bacon")
        let mysteryMeat = Food()

        print(nameOfMeat.name)
        print(mysteryMeat.name)

        var breakfastList = [
            ShoppingListItem(),
            ShoppingListItem(name: "Bacon"),
            ShoppingListItem(name: "Eggs", quantity: 6)
        ]
        breakfastList[0].name = "Orange juice"
        breakfastList[0].purchased = true
//        breakfastList[0].description = "jizz" // get only!
        for item in breakfastList {
            print(item.description)
        }

        // Failable initializer
        let wholeNumber: Double = 12345.1
        let pi = 3.14159

        if let valueMaintained = Int(exactly: wholeNumber) {
            print("\(wholeNumber) --> \(valueMaintained)")
        }

        let valueChanged = Int(exactly: pi)
        if valueChanged == nil {
            print("\(pi) g_g")
        }

        struct Animal {
            let species: String
            init?(species: String) {
                if species.isEmpty {
                    return nil
                }
                self.species = species
            }
        }

        let someCreature = Animal(species: "Giraffe")
        if let giraff = someCreature {
            print("An animal was initialized with a species of \(giraff.species)")
        }
        let anotherCreature = Animal(species: "")
        if anotherCreature == nil {
            print("The annoymous creature could not be initialized")
        }

        // Failable Initializers for Enumerations
        enum TemperatureUnit {
            case kelvin, celsius, fahrenheit
            init?(symbol: Character) {
                switch symbol {
                case "k":
                    self = .kelvin
                case "c":
                    self = .celsius
                case "f":
                    self = .fahrenheit
                default:
                    return nil
                }
            }
        }

        let unknowUnit = TemperatureUnit(symbol: "g")
        if unknowUnit == nil {
            print("Unknown Unit")
        }

        // Failable Initialzers for Enumerations with Raw Value
        enum tempUnit: Character {
            case kelvin = "k", celsius = "c", fahrenheit = "f"
        }

//        let fUnit = tempUnit(rawValue: "f")
        let unkonwnUnit = tempUnit(rawValue: "d")
        if unkonwnUnit == nil {
            print("it's nil~")
        }

        // Propagation of Initialzation Failure
        class Product {
            let name: String
            init?(name: String) {
                if name.isEmpty { return nil }
                self.name = name
            }
        }

        class CartItem: Product {
            let quantity: Int
            init?(name: String, quantity: Int) {
                if quantity < 1 { return nil }
                self.quantity = quantity
                super.init(name: name)
            }
        }

        if let twoSocks = CartItem(name: "sock", quantity: 2) {
            print(twoSocks)
        } else {
            print("g_g")
        }
    }
}
