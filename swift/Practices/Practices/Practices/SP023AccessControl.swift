//
//  SP023AccessControl.swift
//  Practices
//
//  Created by Qingcheng Li on 5/17/19.
//  Copyright © 2019 Qing-Cheng Li. All rights reserved.
//

import UIKit

class SP023AccessControl {

}

extension SP023AccessControl: SPPracticeRunnable {
    func run() {
        // each build target in Xcode is treated as a separate module in Swift.
        struct TrackedString {
            private(set) var numberOfEdits = 0
            var value: String = "" {
                didSet {
                    numberOfEdits += 1
                }
            }
        }

        var stringToEdit = TrackedString()
        stringToEdit.value = "A"
//        stringToEdit.numberOfEdits = 2
        stringToEdit.value = "B"
        stringToEdit.value = "C"
        print(stringToEdit.numberOfEdits)

    }
}
