// Properties

// Stored Properties

// variable stored properties // var
// constant stored properties // let

// default property value

//

struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)

rangeOfThreeItems.firstValue = 6

// Stored properties of constant structure instances

let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
//rangeOfFourItems.firstValue = 6

// lazy stored properties

class DataImporter {
    var filename = "data.txt"
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")

// at this moment, importer still nil, it's not init

print(manager.importer.filename)    // now it init

// NOTE: there is no guarantee the lazy property will be initialized once

// Computed properties

struct Point {
    var x = 0.0
    var y = 0.0
}

struct Size {
    var width = 0.0
    var height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + size.width / 2
            let centerY = origin.y + size.height / 2
            return Point(x: centerX, y: centerY)
        }
//        set(newCenter) {
//            origin.x = newCenter.x - (size.width / 2)
//            origin.y = newCenter.y - (size.height / 2)
//        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}

var square = Rect(origin: Point(x: 0.0, y: 0.0),
                  size: Size(width: 10.0, height: 10.0))

let initialSquareCenter = square.center
square.center = Point(x: 15.0, y:15.0)
print("Square origin is now at \(square.origin.x) \(square.origin.y)")

// Read-only Computed Properties

struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {    // read-only computed property
        return width * height * depth
    }
}

let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("Volume: \(fourByFiveByTwo.volume)")

// Property Observers

// called every time a property's value is set, even if the new value is same as current value
// can't use on lazy stored property
// can add on inherited properties

class StepCounter {
    var totalSteps: Int = 0 {
        willSet {
            print("Will Set \(newValue) to replace \(totalSteps)")
        }
        didSet {
            print("Did set \(totalSteps) to replace \(oldValue)")
        }
    }
    func increase() {
        totalSteps += 1
    }
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 10

stepCounter.increase()

stepCounter.totalSteps = 20

// Type Properties
// across instance??? --> static !?
// use static, use class to make overrideable.

struct SomeStructure {
    static var storedTypepProperties = "Some value."
    static var computedTypeProperties: Int {
        return 1
    }
}

enum SomeEnumeration {
    static var storedTypeProperty = "Some enum value"
    static var computedTypeProperty: Int {
        return 6
    }
}

class SomeClass {
    static var storedTypeProperty = "Yooo"
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}

print(SomeStructure.storedTypepProperties)
SomeStructure.storedTypepProperties = "jIZZ"
print(SomeStructure.storedTypepProperties)

// Querying and Setting Type Properties
struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannel = 0
    var currentLevel: Int = 0 {
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                currentLevel = AudioChannel.thresholdLevel
            }

            if currentLevel > AudioChannel.maxInputLevelForAllChannel {
                AudioChannel.maxInputLevelForAllChannel = currentLevel
            }
        }
    }
}

var leftChannel = AudioChannel()
var rightChannel = AudioChannel()

leftChannel.currentLevel = 7
rightChannel.currentLevel = 11

print(rightChannel.currentLevel)
print(AudioChannel.maxInputLevelForAllChannel)
