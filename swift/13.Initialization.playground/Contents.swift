// Initialization

struct Fahrenheit {
    var temperature: Double
//    var test: Double
    init() {
        temperature = 32.0
    }
}

var f = Fahrenheit()

print("f = \(f.temperature)")

struct FahrenheitA {
    var temperature = 32.0
}

var fa = FahrenheitA()
var fb = FahrenheitA(temperature: 40)

// initializer have to initialize all vars

// Customizing Initialization

struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit:Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}

let bollingPointOfWater = Celsius(fromFahrenheit: 212.0)
let freezingPointOfWater = Celsius(fromKelvin: 273.15)

// Parameter names and arguement labels

struct Color {
    var r,g,b: Double
    init(red r:Double, green g:Double, blue b:Double) {
        self.r = r
        self.g = g
        self.b = b
    }

    init(white: Double) {
        r = white
        g = white
        b = white
    }

    init(_ jizz: Double) {
        r = 1.0
        g = 1.0
        b = jizz
    }
}

let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)
let jizz = Color(0.14)

class SurveryQuestion {
    let text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}

let cheeseQuestion = SurveryQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()

cheeseQuestion.response = "Yes, I do"

// Default initializer

class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}

var item = ShoppingListItem()

struct Size {
    var width: Int
    var height: Int
}

var size = Size(width: 1, height: 2)


