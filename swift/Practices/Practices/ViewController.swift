//
//  ViewController.swift
//  Practices
//
//  Created by Qingcheng Li on 5/13/19.
//  Copyright © 2019 Qing-Cheng Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("View did appear!")

        //let sp13 = SP013Initialization()
        //sp13.run()

        //let testPoint = Point(x: 1, y: 2)

//        var sp14: SP014Deinit? = SP014Deinit()
//        sp14?.run()
//        sp14 = nil

        var sp15: SP015ErrorHandling? = SP015ErrorHandling()
        sp15?.run()
        sp15 = nil
    }
}

