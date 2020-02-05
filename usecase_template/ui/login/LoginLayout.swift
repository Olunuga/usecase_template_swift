//
//  LoginLayout.swift
//  usecase_template
//
//  Created by OLUNUGA Mayowa on 02/02/2020.
//  Copyright © 2020 OLUNUGA Mayowa. All rights reserved.
//

import Foundation
import UIKit
class LoginLayout : UIView, UITextFieldDelegate {
    
    let topView : UIView = {
        let v = UIView()
        //v.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let textFieldWrapper : UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.borderWidth = 1.5
        v.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.3)
        v.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 0.5)
        v.layer.cornerRadius = 5
        return v
    }()
    let userNameField : UITextField = {
        let tf = UITextField()
        tf.returnKeyType = UIReturnKeyType.done
        tf.placeholder = "e.g You@example.com"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(backgroundTapped))
        self.addGestureRecognizer(tapGestureRecognizer)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func backgroundTapped(){
        self.endEditing(true)
    }
    
    fileprivate func setUpView(){
      self.addSubview(topView)
      textFieldWrapper.addSubview(userNameField)
      topView.addSubview(textFieldWrapper)
      userNameField.delegate = self
        
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            topView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            topView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            topView.heightAnchor.constraint(equalToConstant: 200)
            ])
        
        NSLayoutConstraint.activate([
            textFieldWrapper.heightAnchor.constraint(equalToConstant: 60),
            textFieldWrapper.centerYAnchor.constraint(equalTo: topView.centerYAnchor),
            textFieldWrapper.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 20),
            textFieldWrapper.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -20)
            
            ])
        
        NSLayoutConstraint.activate([
            userNameField.topAnchor.constraint(equalTo: textFieldWrapper.topAnchor),
            userNameField.leadingAnchor.constraint(equalTo: textFieldWrapper.leadingAnchor,constant: 10),
            userNameField.trailingAnchor.constraint(equalTo: textFieldWrapper.trailingAnchor, constant: -10),
            userNameField.bottomAnchor.constraint(equalTo: textFieldWrapper.bottomAnchor)
            
            ])
        
    }
    
}

extension LoginLayout {
    func textFieldDidBeginEditing(_ textField: UITextField) {
           self.textFieldWrapper.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
           self.textFieldWrapper.layer.borderColor = #colorLiteral(red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0)
           self.textFieldWrapper.dropShadow(color:#colorLiteral(red: 1.0, green: 0.5, blue: 0.0, alpha: 0.5) , radius: 2)
  
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.textFieldWrapper.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.3)
        self.textFieldWrapper.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 0.5)
        textFieldWrapper.removeDropShadow()
    }
}
