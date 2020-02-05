//
//  Buttons.swift
//  usecase_template
//
//  Created by OLUNUGA Mayowa on 05/02/2020.
//  Copyright © 2020 OLUNUGA Mayowa. All rights reserved.
//

import Foundation
import UIKit

class Buttons : UIView {
    var dim : CGFloat = 80
    var radius : CGFloat = 40

    let roundButton1 : UIButton = {
        let v = UIButton()
        v.round(text: "1")
        return v
    }()
    
    let roundButton2 : UIButton = {
        let v = UIButton()
        v.round(text: "2")
        return v
    }()
    
    let roundButton3 : UIButton = {
        let v = UIButton()
        v.round(text: "3")
        return v
    }()
    
    let roundButton4 : UIButton = {
        let v = UIButton()
        v.round(text: "4")
        return v
    }()
    
    let roundButton5 : UIButton = {
        let v = UIButton()
        v.round(text: "5")
        return v
    }()
    
    let roundButton6 : UIButton = {
        let v = UIButton()
        v.round(text: "6")
        return v
    }()
    
    let roundButton7 : UIButton = {
        let v = UIButton()
        v.round(text: "7")
        return v
    }()
    
    let roundButton8 : UIButton = {
        let v = UIButton()
        v.round(text: "8")
        return v
    }()
    
    let roundButton9 : UIButton = {
        let v = UIButton()
        v.round(text: "9")
        return v
    }()
    
    let roundButton0 : UIButton = {
        let v = UIButton()
        v.round(text: "0")
        return v
    }()
    
    let roundButtonClear : UIButton = {
        let v = UIButton()
        v.round(text: "<=")
        return v
    }()
    
    let roundButtonCancel : UIButton = {
        let v = UIButton()
        v.round(text: "X")
        return v
    }()
    
    
    let buttonWrap1 : UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let buttonWrap2 : UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let buttonWrap3 : UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let buttonWrap4 : UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let buttonWrap5 : UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let buttonWrap6 : UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let buttonWrap7 : UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let buttonWrap8 : UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let buttonWrap9 : UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let buttonWrap0 : UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let buttonWrapCancel : UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let buttonWrapClear : UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        buttonWrap1.addSubview(roundButton1)
        buttonWrap2.addSubview(roundButton2)
        buttonWrap3.addSubview(roundButton3)
    
        buttonWrap4.addSubview(roundButton4)
        buttonWrap5.addSubview(roundButton5)
        buttonWrap6.addSubview(roundButton6)
        
        buttonWrap7.addSubview(roundButton7)
        buttonWrap8.addSubview(roundButton8)
        buttonWrap9.addSubview(roundButton9)
        
        buttonWrapCancel.addSubview(roundButtonCancel)
        buttonWrap0.addSubview(roundButton0)
        buttonWrapClear.addSubview(roundButtonClear)
        
        
        NSLayoutConstraint.activate([
            roundButton1.heightAnchor.constraint(equalToConstant: dim),
            roundButton1.widthAnchor.constraint(equalToConstant: dim),
            roundButton1.centerXAnchor.constraint(equalTo: buttonWrap1.centerXAnchor),
            roundButton1.centerYAnchor.constraint(equalTo: buttonWrap1.centerYAnchor),
            
            roundButton2.heightAnchor.constraint(equalToConstant: dim),
            roundButton2.widthAnchor.constraint(equalToConstant: dim),
            roundButton2.centerXAnchor.constraint(equalTo: buttonWrap2.centerXAnchor),
            roundButton2.centerYAnchor.constraint(equalTo: buttonWrap2.centerYAnchor),
            
            roundButton3.heightAnchor.constraint(equalToConstant: dim),
            roundButton3.widthAnchor.constraint(equalToConstant: dim),
            roundButton3.centerXAnchor.constraint(equalTo: buttonWrap3.centerXAnchor),
            roundButton3.centerYAnchor.constraint(equalTo: buttonWrap3.centerYAnchor),
            
            roundButton4.heightAnchor.constraint(equalToConstant: dim),
            roundButton4.widthAnchor.constraint(equalToConstant: dim),
            roundButton4.centerXAnchor.constraint(equalTo: buttonWrap4.centerXAnchor),
            roundButton4.centerYAnchor.constraint(equalTo: buttonWrap4.centerYAnchor),
            
            roundButton5.heightAnchor.constraint(equalToConstant: dim),
            roundButton5.widthAnchor.constraint(equalToConstant: dim),
            roundButton5.centerXAnchor.constraint(equalTo: buttonWrap5.centerXAnchor),
            roundButton5.centerYAnchor.constraint(equalTo: buttonWrap5.centerYAnchor),
            
            roundButton6.heightAnchor.constraint(equalToConstant: dim),
            roundButton6.widthAnchor.constraint(equalToConstant: dim),
            roundButton6.centerXAnchor.constraint(equalTo: buttonWrap6.centerXAnchor),
            roundButton6.centerYAnchor.constraint(equalTo: buttonWrap6.centerYAnchor),
            
            roundButton7.heightAnchor.constraint(equalToConstant: dim),
            roundButton7.widthAnchor.constraint(equalToConstant: dim),
            roundButton7.centerXAnchor.constraint(equalTo: buttonWrap7.centerXAnchor),
            roundButton7.centerYAnchor.constraint(equalTo: buttonWrap7.centerYAnchor),
            
            roundButton8.heightAnchor.constraint(equalToConstant: dim),
            roundButton8.widthAnchor.constraint(equalToConstant: dim),
            roundButton8.centerXAnchor.constraint(equalTo: buttonWrap8.centerXAnchor),
            roundButton8.centerYAnchor.constraint(equalTo: buttonWrap8.centerYAnchor),
            
            roundButton9.heightAnchor.constraint(equalToConstant: dim),
            roundButton9.widthAnchor.constraint(equalToConstant: dim),
            roundButton9.centerXAnchor.constraint(equalTo: buttonWrap9.centerXAnchor),
            roundButton9.centerYAnchor.constraint(equalTo: buttonWrap9.centerYAnchor),
            
            roundButtonCancel.heightAnchor.constraint(equalToConstant: dim),
            roundButtonCancel.widthAnchor.constraint(equalToConstant: dim),
            roundButtonCancel.centerXAnchor.constraint(equalTo: buttonWrapCancel.centerXAnchor),
            roundButtonCancel.centerYAnchor.constraint(equalTo: buttonWrapCancel.centerYAnchor),
            
            roundButton0.heightAnchor.constraint(equalToConstant: dim),
            roundButton0.widthAnchor.constraint(equalToConstant: dim),
            roundButton0.centerXAnchor.constraint(equalTo: buttonWrap0.centerXAnchor),
            roundButton0.centerYAnchor.constraint(equalTo: buttonWrap0.centerYAnchor),
            
            roundButtonClear.heightAnchor.constraint(equalToConstant: dim),
            roundButtonClear.widthAnchor.constraint(equalToConstant: dim),
            roundButtonClear.centerXAnchor.constraint(equalTo: buttonWrapClear.centerXAnchor),
            roundButtonClear.centerYAnchor.constraint(equalTo: buttonWrapClear.centerYAnchor),
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
