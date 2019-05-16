//
//  SP019Protocol.swift
//  Practices
//
//  Created by Qingcheng Li on 5/16/19.
//  Copyright © 2019 Qing-Cheng Li. All rights reserved.
//

import UIKit

protocol SPPracticeRunnable {
    func run() -> Void
}

class SP019Protocol {
    init() {
        print("### Protocol")
    }

    deinit {
        print("### End of Protocol")
    }
}

private protocol SomeProtocol {
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable: Int {get}
}

private protocol RandomNumberGenerator {
    func random() -> Double
}

private class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy: m))
        return lastRandom / m
    }
    func randomBool() -> Bool {
        return true
    }
}

private class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

private protocol DiceGame {
    var dice: Dice { get }
    func play()
}

private protocol DiceGameDelegate: AnyObject {  // using AnyObject to indicate this is a class-only protocol
    func gameDidStart(_ game: DiceGame)
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll didRoll: Int)
    func gameDidEnd(_ game: DiceGame)
}

private class SnakesAndLadder: DiceGame {
    let finalSquare = 25
    let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    var square = 0
    var board: [Int]
    init() {
        board = Array(repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    }
    weak var delegate: DiceGameDelegate?
    func play() {
        square = 0
        delegate?.gameDidStart(self)
        gameLoop: while square != finalSquare {
            let diceRoll = dice.roll()
            delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
            switch square + diceRoll {
            case finalSquare:
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                continue gameLoop
            default:
                square += diceRoll
                square += board[square]
            }
        }
        delegate?.gameDidEnd(self)
    }
}

@objc
private protocol TestProtocol: AnyObject {
    @objc optional var test:Int { get set }
}

// extend protocol's impl, since it's already confrim with protocol so we're able to extend it
// and use protocol extension to provide default impl
private extension RandomNumberGenerator {
    func randomBool() -> Bool {
        return random() > 0.5
    }
}

private extension Collection where Element: Equatable {
    func allEqual() -> Bool {
        for element in self {
            if element != self.first {
                return false
            }
        }
        return true
    }
}

extension SP019Protocol: SPPracticeRunnable {


    func run() {

        var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
        for _ in 0..<6 {
            print(d6.roll())
        }
    }
}
