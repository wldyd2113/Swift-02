//
//  ViewController.swift
//  UIKitCodeonly
//
//  Created by 차지용 on 7/8/24.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    let button: UIButton = {
        let button = UIButton(type: .system)
        var config = UIButton.Configuration.plain()
        config.title = "Button"
        button.configuration = config
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "ViewController"
        view.backgroundColor = .white
        
        view.addSubview(button)
        button.addTarget(self, action: #selector(buttonChange), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func buttonChange() {
        let hostingController = UIHostingController(rootView: SwiftUIView(name: "Nancy"))
        self.navigationController?.pushViewController(hostingController, animated: true)
    }

}

