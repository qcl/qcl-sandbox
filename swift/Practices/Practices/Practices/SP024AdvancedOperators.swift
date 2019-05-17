//
//  SP024AdvancedOperators.swift
//  Practices
//
//  Created by Qingcheng Li on 5/17/19.
//  Copyright © 2019 Qing-Cheng Li. All rights reserved.
//

import UIKit

// MARK: Operator
private struct Vector2D {
    var x = 0.0, y = 0.0
}

extension Vector2D {
    static func + (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y + right.y)
    }

    static prefix func - (vector: Vector2D) -> Vector2D {
        return Vector2D(x: -vector.x, y: -vector.y)
    }

    static func += (left: inout Vector2D, right: Vector2D) {
        left = left + right
    }

    static func == (left: Vector2D, right: Vector2D) -> Bool {
        return false    // TODO
    }

//    static prefix func +火+ (vector: inout Vector2D) {
//
//    }
}


class SP024AdvancedOperators: SPPracticeRunnable {
    func run() {
        // MARK: Bitwise
        let initialBits: UInt8 = 0b00001111
        let invertedBits = ~initialBits // ~ NOT
        print(invertedBits)

        let firstSixBits: UInt8 = 0b11111100
        let lastSixBits: UInt8  = 0b00111111
        let middleFourBits = firstSixBits & lastSixBits // & AND
        print(middleFourBits)

        let a: UInt8 = 0b0000_0001
        let b: UInt8 = 0b0000_0010
        let c = a | b   // | OR
        print(c)

        let d: UInt8 = 0b0000_0101
        let e: UInt8 = 0b0000_0110
        let f = d ^ e   // ^ XOR
        print(f)

        // MARK: Shift
        let g: UInt8 = 0b1000_0000
        print(g << 1)
        print(g >> 7)
        let h: Int8 = 1
        print(h << 6)
        print(h << 7)   // overflow lol

        // MARK: Overflow Operators
        var potentialOverflow = Int16.max
//        potentialOverflow += 1  // fail
        potentialOverflow = potentialOverflow &+ 1  // overflow addition &+
        print(potentialOverflow)

        // there are also &- for subtraction and &* for multiplication

    }
}
