import UIKit

var str = "Hello, playground"

struct SomeStruct {

}

class SomeClass {

}

struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name:String?
}

let someResolution = Resolution()
let someVideoMode = VideoMode()

// Accessing Properties

someVideoMode.resolution.width = 1280

print("The width of someResolution is \(someResolution.width)")
print("The width of someVideoMode is \(someVideoMode.resolution.width)")

// Memberwise Initializers for Structure Type

let vga = Resolution(width: 640, height: 480)

// Structues and Enumerations Are Value Types

let hd = Resolution(width: 1920, height: 1080)
var cinema = hd

cinema.width = 2048

print("cinema is now \(cinema.width) pixels width")
print("hd is still \(hd.width) pxiels width")

enum CompassPoint {
    case north, south, east, west
    mutating func turnNorth() {
        self = .north
    }
}

var currentDirection = CompassPoint.west
let rememberedDirection = currentDirection

currentDirection.turnNorth()

print("The current direction is \(currentDirection)")
print("The remembered direction is \(rememberedDirection)")

// classese are reference types

let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

print("The frame rate of tenEighty is \(tenEighty.frameRate)")

// identity operators

// 2 identiy operators
// * Identical to (===)
// * Not identical to (!==)

if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}

