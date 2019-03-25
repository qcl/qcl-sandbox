// Methods

// Instance method

class Counter {
    var count = 0
    func increment() {
        //count += 1
        self.count += 1
    }
    func increment(by amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}

let counter = Counter()
counter.increment()
counter.increment(by: 10)
counter.reset()

// self

struct Point {
    var x = 0.0, y = 0.0

    func isToTheRightOf(x: Double) -> Bool {
        return self.x > x
    }
}

let somePoint = Point(x: 4, y: 5)
if somePoint.isToTheRightOf(x: 1) {
    print("This point is to the right of the line x == 1")
}

// Modifying Value Type from Within Instance Method

struct Point2 {
    var x = 0.0, y = 0.0

    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}

// Assigning to self within a mutating method

enum TriStateSwitch {
    case off, low, high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}

var ovenLight = TriStateSwitch.low
ovenLight.next()
ovenLight.next()

// Type methods

class SomeClass {
    class func someTypeMethod() {
        print("Some type method")
    }
}

SomeClass.someTypeMethod()

struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1

    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
        }
    }

    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }

    //@discardableResult    // <-- what is this ??
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playerName: String
    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    init(name: String) {
        playerName = name
    }
}

var player = Player(name: "Argrios")
player.complete(level: 1)
print("Highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")

player = Player(name: "Beto")
if player.tracker.advance(to: 6) {
    print("--> 6")
} else {
    print("Lv 6 is not unlocked")
}

