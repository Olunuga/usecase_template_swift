//
//  LoginViewController.swift
//  usecase_template
//
//  Created by OLUNUGA Mayowa on 19/01/2020.
//  Copyright © 2020 OLUNUGA Mayowa. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController : ViewController {
    var loginLayout = LoginLayout()
    
    override func viewDidLoad() {
        addLayout()
    }
    
   fileprivate func addLayout(){
    loginLayout.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(loginLayout)
    
    NSLayoutConstraint.activate([
        loginLayout.widthAnchor.constraint(equalTo: view.widthAnchor),
        loginLayout.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
    }
}
