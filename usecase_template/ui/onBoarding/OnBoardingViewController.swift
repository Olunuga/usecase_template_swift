//
//  OnBoardingViewController.swift
//  usecase_template
//
//  Created by OLUNUGA Mayowa on 02/02/2020.
//  Copyright © 2020 OLUNUGA Mayowa. All rights reserved.
//

import Foundation
import UIKit

class OnBoardingViewController : ViewController {
    var layout : OnBoardingLayout?
    var registerButton: UIButton?
    var loginButton : UIButton?
    
    var timer : Timer?
    var fadeInText: UILabel?
    var fadeInImage : UIImageView?
    var timerDelay : Double = 3
    
    override func viewDidLoad() {
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.navigationController?.navigationBar.isHidden = true
        addLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //This is so because time doesnt work on backgroun thread
        DispatchQueue.main.async {
            self.setUpFadeInOutTimer()
        }
    }
    
    fileprivate func addLayout(){
        layout = OnBoardingLayout()
        registerButton = layout?.registerButton
        loginButton = layout?.loginButton
        
        layout?.translatesAutoresizingMaskIntoConstraints = false
        layout?.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
        layout?.widthAnchor.constraint(equalToConstant:view.frame.width).isActive = true
        view.addSubview(layout!)
        
        
        registerButton?.addTarget(self, action: #selector(handleRegisterClicked(_:)), for: .touchUpInside)
        
        loginButton?.addTarget(self, action: #selector(handleLoginClicked), for: .touchUpInside)
    }
    
    func setUpFadeInOutTimer(){
        fadeInText = layout?.fadeInViewText
        fadeInImage = layout?.fadeInViewImage
        
        timer = Timer.scheduledTimer(timeInterval: timerDelay, target: self, selector: #selector(handleTimer), userInfo: nil, repeats: false)
    
    }
    
    @objc func handleRegisterClicked(_ sender: AnyObject?){
        debugPrint("Register button clicked")
        let loginViewController = LoginViewController()
        navigationController?.pushViewController(loginViewController, animated: true)
    }
    
    @objc func handleLoginClicked(_ sender: AnyObject?){
        debugPrint("Register button clicked")
        let homeViewController = HomeViewController()
        navigationController?.pushViewController(homeViewController, animated: true)
    }
    
    
    @objc func handleTimer(){
        print("Handle timer called")
        fadeOutView()
    }
    
    @objc func fadeInView(){
        UIView.animate(withDuration: 5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
            self.fadeInImage?.alpha = 1
            self.fadeInText?.alpha = 1
        }, completion: { completed in
            
            if completed {
                self.timer = Timer.scheduledTimer(timeInterval: self.timerDelay, target: self, selector: #selector(self.fadeOutView), userInfo: nil, repeats: false)
            }
           
        })
      
    }
  @objc func fadeOutView(){
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.fadeInImage?.alpha = 0
            self.fadeInText?.alpha = 0
        },  completion: { completed in
            if completed {
                 self.fadeInView()
            }
        })
    }
    
    override func viewDidDisappear(_ animated: Bool){
        debugPrint("Timer invalidated")
         timer?.invalidate()
    }

}
