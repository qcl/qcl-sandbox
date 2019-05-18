//
//  SP101GCD.swift
//  Practices
//
//  Created by Qing-Cheng Li on 2019/5/18.
//  Copyright © 2019 Qing-Cheng Li. All rights reserved.
//

import UIKit

class SP101GCD: SPPracticeRunnable {
    func run() {
        // MARK: ASYNC
        DispatchQueue.main.async {
            print("in async")
        }
        print("out side, below async")

        let backgroundQueue: DispatchQueue = DispatchQueue(label: "background", qos: .background, attributes: .concurrent, autoreleaseFrequency: .inherit, target: DispatchQueue.main)
        backgroundQueue.async {
            print("background code")
            DispatchQueue.main.async {
                print("hand over to main?")
            }
        }
    }
    
}
