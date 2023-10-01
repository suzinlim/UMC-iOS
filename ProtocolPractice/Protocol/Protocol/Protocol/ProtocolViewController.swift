//
//  ProtocolViewController.swift
//  Protocol
//
//  Created by 임수진 on 2023/10/01.
//

import UIKit

protocol Flyable {
    func fly()
}

protocol Runnable {
    func run()
}

class Person: Flyable, Runnable {
    func run() {
        print("달렸다.")
    }
    
    func fly() {
        print("날았다.")
    }
    
}

class ProtocolViewController: UIViewController {

    let person = Person()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        person.fly()
        person.run()
    }

}
