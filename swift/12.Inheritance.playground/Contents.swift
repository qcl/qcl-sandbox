// Inheritance

// Defining a base class

class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        // do nothing
    }
}

let someVehicle = Vehicle()
print("Vehicle: \(someVehicle.description)")

// Subclassing

class Bicycle: Vehicle {
    var hasBasket = false
}

let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 15.0

print("Bicycle: \(bicycle.description)")

class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}

let tandom = Tandem()
tandom.hasBasket = true
tandom.currentNumberOfPassengers = 2
tandom.currentSpeed = 22.0

print("Tandem: \(tandom.description)")

// Overriding

class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo")
    }
}

let train = Train()
train.makeNoise()

class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + "in gear \(gear)"
    }
}

let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print("Car: \(car.description)")

class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed/10.0) + 1
        }
    }
}

let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print("Automatic: \(automatic.description)")

// Prevent Overriding

class someClass {
    func someMethod() {
        print("Some method")
    }
    final func someFinalMethod() {
        print("Some final method")
    }
}

class someSubClass: someClass {
    override final func someMethod() {
        print("override some method")
    }
//    override func someFinalMethod() {
//        print("override some final method")
//    }
}


