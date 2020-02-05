//
//  PassCodeViewController.swift
//  usecase_template
//
//  Created by OLUNUGA Mayowa on 04/02/2020.
//  Copyright © 2020 OLUNUGA Mayowa. All rights reserved.
//

import Foundation
import UIKit

class PassCodeController : ViewController {
    
    var layout : PassCodeLayout?
    
    override func viewDidLoad() {
        addLayout()
        layout?.delegate = self
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    func addLayout(){
        layout = PassCodeLayout()
        layout?.translatesAutoresizingMaskIntoConstraints = false
        layout?.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
        layout?.widthAnchor.constraint(equalToConstant:view.frame.width).isActive = true
        view.addSubview(layout!)
    }
}

extension PassCodeController : PassCodeDelegate {
    func completed(text: String) {
        
    }
    
    func close() {
        self.navigationController?.popViewController(animated: true)
    }
}
