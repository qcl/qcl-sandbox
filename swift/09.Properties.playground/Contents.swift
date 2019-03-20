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




