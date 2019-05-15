//
//  SP014Deinit.swift
//  Practices
//
//  Created by Qingcheng Li on 5/15/19.
//  Copyright © 2019 Qing-Cheng Li. All rights reserved.
//

import UIKit

class SP014Deinit {
    init() {
        print("Init of SP14")
    }

    deinit {
        print("Deinit of \(self)")
    }

    // MARK: RUN!
    func run () {
        // MARK: Deinitializer in Action
        class Bank {
            static var coinsInBank = 10_000
            static func distribute(coins numberOfCoinsRequired: Int) -> Int {
                let numberOfCoinsToVend = min(coinsInBank, numberOfCoinsRequired)
                coinsInBank -= numberOfCoinsToVend
                return numberOfCoinsToVend
            }
            static func receive(coins: Int) {
                coinsInBank += coins
            }
        }

        class Player {
            var coinsInPurse: Int
            init(coins: Int) {
                coinsInPurse = Bank.distribute(coins: coins)
            }
            func win(coins: Int) {
                coinsInPurse += Bank.distribute(coins: coins)
            }
            deinit {
                Bank.receive(coins: coinsInPurse)
            }
        }

        var player: Player? = Player(coins: 100)
        print("A new player has joined the game with \(player!.coinsInPurse)")
        print("There are now \(Bank.coinsInBank) coins left in the bank.")
        player!.win(coins: 2_000)
        print("player won 2000 coins & now has\(player!.coinsInPurse) coins")
        print("The bank now only has \(Bank.coinsInBank) coins")
        player = nil
        print("player has left the game")
        print("The bank now has \(Bank.coinsInBank) coins")

        optionalChaining()
    }

    // MARK: Optional Chaining
    func optionalChaining() {
        class Person {
            var residence: Residence?
        }

        class Residence {
            var numberOfRooms: Int {
                return rooms.count
            }
            var rooms = [Room]()
            subscript(i: Int) -> Room {
                // seems here doesn't hanlde index out of range issue
                get {
                    return rooms[i]
                }
                set {
                    rooms[i] = newValue
                }
            }
            var address: Address?
            func printNumberOfRooms() {
                print("The number of rooms is \(numberOfRooms)")
            }
        }

        class Room {
            let name: String
            init(name: String) {
                self.name = name
            }
        }

        class Address {
            var buildingName: String?
            var buildingNumber: String?
            var street: String?
            func buildingIdentifier() -> String? {
                if let buildingNumber = buildingNumber, let street = street {
                    return "\(buildingNumber) \(street)"
                } else if buildingName != nil {
                    return buildingName
                } else {
                    return nil
                }
            }
        }

        let john = Person()
//        let roomCount = john.residence!.numberOfRooms // crash

//        john.residence = Residence()


        let someAddress = Address()
        someAddress.buildingNumber = "29"
        someAddress.street = "Acacia Rod"
        john.residence?.address = someAddress

        john.residence?.address = {
            print("高雄發大財")  // this wouldn't print out because recisence is nil.
            return someAddress
        }()

        if let roomCount = john.residence?.numberOfRooms {
            print(roomCount)
        } else {
            print("There is no room count")
        }

        if john.residence?.printNumberOfRooms() != nil {    // func with return value actually return a `()`, which is empty tuple.
            print("It was possible to print the number of rooms")
        } else {
            print("It was not possible to print the number of rooms")
        }

        // Any attempt to set value thtough optional chain returns a value of type `Void?`
        if (john.residence?.address = someAddress) != nil {
            print("value is set")
        } else {
            print("value isn't set")
        }

        let johnHouse = Residence()
        johnHouse.rooms.append(Room(name: "Living room"))
        johnHouse.rooms.append(Room(name: "Kitchen"))
        john.residence = johnHouse

        if let firstRoomName = john.residence?[0].name {
            print("The first room name is \(firstRoomName)")
        } else {
            print("Unable to get first room name")
        }

        var testDict = ["a": [1,2], "b": [3,4] ]
        testDict["c"]?[0] += 1  // nothing happen.

        print(testDict)
    }
}
