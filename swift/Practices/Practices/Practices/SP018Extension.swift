//
//  SP018Extension.swift
//  Practices
//
//  Created by Qingcheng Li on 5/16/19.
//  Copyright © 2019 Qing-Cheng Li. All rights reserved.
//

import UIKit

private extension Double {
    var km: Double {
        return self * 1_000.0
    }
    var m: Double {
        return self
    }
}

private extension Int {
    func repeatition(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }

    mutating func square() {
        self = self * self;
    }
}

private extension Int {
    subscript(digitIndex:Int) -> Int {
        var b = 1
        for _ in 0..<digitIndex {
            b *= 10
        }
        return (self / b) % 10
    }

    subscript(str:String) -> Int {
        if str == "a" {
            return 1
        } else {
            return 0
        }
    }
}

private extension Int {
    enum Kind {
        case negative, zero, postive
    }

    var kind: Kind {
//        if self < 0 {
//            return .negative
//        } else if self == 0 {
//            return .zero
//        } else {
//            return .postive
//        }
        switch self {
        case 0:
            return .zero
        case let x where x > 0:
            return .postive
        default:
            return .negative
        }
    }
}

class SP018Extension {
    init() {
        print("### Extension ###")
    }

    deinit {
        print("### End of Extension ###")
    }

    func run () {
        let distance = 9000.0.km
        print("Distance is \(distance) m")

        3.repeatition {
            print("高雄發大財！")
        }

        var num = 3
        num.square();

        print(362880[2])
        print(1124["a"])
        print(1124["b"])

        let kind: Int.Kind = 0.kind
        print(kind)
    }
}
