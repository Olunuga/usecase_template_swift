//
//  HomeView.swift
//  usecase_template
//
//  Created by OLUNUGA Mayowa on 29/01/2020.
//  Copyright © 2020 OLUNUGA Mayowa. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController : ViewController, SwipeAnimationProtocol {
    var timer : Timer?
    var accepted = false
    func completed(completed: Bool) {
        //Todo: move to the next page
        print("Swipe to accept completed")
        if !accepted {
            accepted = true
              timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(navigate), userInfo: nil, repeats: false)
        }
    }
    
    var homeLayout =  HomeViewLayout()
    
    override func viewDidLoad() {
         self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
         homeLayout.delegate = self
        
       // homeLayout.parentHeight = view.frame.height
        
    }
    
    @objc func navigate(){
    self.navigationController?.pushViewController(PassCodeController(), animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
       
        homeLayout.parentHeight = view.frame.height
        addLayout()
        homeLayout.updateView()
        addLogic()
    }
    
    func addLayout(){
        homeLayout.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(homeLayout)
        NSLayoutConstraint.activate([
            homeLayout.topAnchor.constraint(equalTo: view.topAnchor),
             homeLayout.bottomAnchor.constraint(equalTo: view.bottomAnchor),
             homeLayout.leadingAnchor.constraint(equalTo: view.leadingAnchor),
             homeLayout.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
        
        debugPrint("HomeController height \(view.frame.height)")
    }
    
    
    func addLogic(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        homeLayout.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap(){
       homeLayout.toggleSheet()
    }
}
