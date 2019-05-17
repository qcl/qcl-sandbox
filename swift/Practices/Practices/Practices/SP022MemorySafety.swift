//
//  SP022MemorySafety.swift
//  Practices
//
//  Created by Qingcheng Li on 5/17/19.
//  Copyright © 2019 Qing-Cheng Li. All rights reserved.
//

import UIKit

class SP022MemorySafety {
}

private func oneMore(than number: Int) -> Int {
    return number + 1
}

private var stepSize = 1
private func increment(_ number: inout Int) {
    number += stepSize
}

private func balance(_ x: inout Int, _ y: inout Int) {
    let sum = x + y
    x = sum/2
    y = sum - x
}

private struct Player {
    var name: String
    var health: Int
    var energy: Int

    static let maxHealth = 10
    mutating func restoreHealth() {
        self.health = Player.maxHealth
    }
}

private extension Player {
    mutating func shareHealth(with teammate: inout Player) {
        balance(&teammate.health, &health)
    }
}

extension SP022MemorySafety: SPPracticeRunnable {
    func run() {
        var one = 1
        one = oneMore(than: one)
        print("\(one)")

        var copyOfStepSize = stepSize
        //increment(&stepSize)  // this would crash the app because cnoflict
        increment(&copyOfStepSize)
        print(stepSize)

        // long-term write access
        var playerOneScore = 42
        var playerTwoScore = 30
        balance(&playerOneScore, &playerTwoScore)
//        balance(&playerOneScore, &playerOneScore)


        var oscar = Player(name: "Oscar", health: 10, energy: 10)
        var maria = Player(name: "Maria", health: 5, energy: 5)
        oscar.shareHealth(with: &maria)
//        oscar.shareHealth(with: &oscar)
        

    }
}
