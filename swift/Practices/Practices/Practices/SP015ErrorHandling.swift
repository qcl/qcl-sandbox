//
//  SP015ErrorHandling.swift
//  Practices
//
//  Created by Qingcheng Li on 5/15/19.
//  Copyright © 2019 Qing-Cheng Li. All rights reserved.
//

import UIKit

enum VendingMachingError: Error {
    case invalidSelection
    case insufficentFunds(coinsNeeded: Int)
    case outOfStock
}

class SP015ErrorHandling {
    init() {
        print("### Error Handling ###")
    }

    deinit {
        print("### ------- ###")
    }

    func testErr () throws -> String {
        return "Error"
    }

    // MARK: Error Handling
    func run () {
        // Error protocol


//        throw VendingMachingError.insufficentFunds(coinsNeeded: 5)

        // Handling Errors

        struct Item {
            var price: Int
            var count: Int
        }

        class VendingMachine {
            var inventory = [
                "Candyy Bar": Item(price: 12, count: 7),
                "Chips": Item(price: 10, count: 4),
                "Pretzels": Item(price: 7, count: 11)
            ]
            var coinsDeposited = 0
            func vend(itemNamed name:String) throws {
                guard let item = inventory[name] else {
                    throw VendingMachingError.invalidSelection
                }

                guard item.count > 0 else {
                    throw VendingMachingError.outOfStock
                }

                guard coinsDeposited >= item.price else {
                    throw VendingMachingError.insufficentFunds(coinsNeeded: item.price - coinsDeposited)
                }
                coinsDeposited -= item.price
                var newItem = item
                newItem.count -= 1
                inventory[name] = newItem
            }
        }

        let vendingMachine = VendingMachine()
        do {
            try vendingMachine.vend(itemNamed: "Jiss")
        } catch {
            print("RRRRRR")
        }

        // try?
        // try!

        // defer

    }
}
