//
//  SP021StrongWeakUnowned.swift
//  Practices
//
//  Created by Qingcheng Li on 5/17/19.
//  Copyright © 2019 Qing-Cheng Li. All rights reserved.
//

import UIKit

private class Customer {
    let name: String
    var card: CredictCard?
    init(name:String) {
        self.name = name
    }
    deinit {
        print("\(name) is being de-init")
    }
}

private class CredictCard {
    let number: UInt64
    unowned let customer: Customer  // basically I think it's a non-optional version weak
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit {
        print("Card \(number) is de-init")
    }
}

private class Country {
    let name: String
    var capitalCity: City!
    init(name: String, captialName: String) {
        self.name = name
        self.capitalCity = City(name: captialName, country: self)
    }
}

private class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
    deinit {
        print("City \(name) is destried")
    }
}

private class HTMLElement {
    let name: String
    let text: String?
    lazy var asHTML: () -> String = {
        [unowned self] in   // define capture list
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    deinit {
        print("\(name) is being de-init")
    }
}


class SP021StrongWeakUnowned {

}

extension SP021StrongWeakUnowned: SPPracticeRunnable {
    func run() {
        var john: Customer?
        john = Customer(name: "John")
        john!.card = CredictCard(number: 1111_0000_0000_0000, customer: john!)
        john = nil

        var heading: HTMLElement? = HTMLElement(name: "h1")
        let defaultText = "Some random string"
        heading!.asHTML = {
            return "<\(heading!.name)>\(heading!.text ?? defaultText)</\(heading!.name)>"
        }
        print(heading!.asHTML())
        heading = nil

        var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hi")
        print(paragraph!.asHTML())
        paragraph = nil
    }
}
