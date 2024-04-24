//
//  ViewController.swift
//  SwiftUItoUIKit
//
//  Created by 차지용 on 4/24/24.
//

import UIKit
import SwiftUI
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBSegueAction func goToSwiftUI(_ coder: NSCoder) -> UIViewController? {
        let greetings = "Hello From UIKit"
        let rootView = Greetings(textFromUIKit: greetings)
        return UIHostingController(coder: coder, rootView: rootView)
    }
    

    @IBSegueAction func goto(_ coder: NSCoder) -> UIViewController? {
        let greetings = "Hello From UIKit"
        let rootView = Greetings(textFromUIKit: greetings)
        return UIHostingController(coder: coder, rootView: rootView)
    }
}

