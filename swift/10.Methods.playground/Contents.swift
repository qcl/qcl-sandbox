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

