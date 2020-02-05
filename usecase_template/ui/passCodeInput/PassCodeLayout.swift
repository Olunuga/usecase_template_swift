//
//  PassCodeLayout.swift
//  usecase_template
//
//  Created by OLUNUGA Mayowa on 05/02/2020.
//  Copyright © 2020 OLUNUGA Mayowa. All rights reserved.
//

import Foundation
import UIKit

protocol PassCodeDelegate {
    func completed(text: String)-> Void
    func close()->Void
}

class PassCodeLayout : Buttons {
    
    var delegate : PassCodeDelegate?
    fileprivate var values : [String] = []
    fileprivate var pinFields : [UIView] = []
    
    let pinContainer : UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let pinStack : UIStackView = {
        let v = UIStackView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.axis = NSLayoutConstraint.Axis.horizontal
        v.distribution = UIStackView.Distribution.fillEqually
        return v
    }()
    
    let mainStack : UIStackView = {
        let v = UIStackView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.axis = NSLayoutConstraint.Axis.vertical
        v.distribution = UIStackView.Distribution.fillEqually
        v.spacing = 5
        return v
    }()
    
    let row1 : UIStackView = {
        let v = UIStackView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.axis = NSLayoutConstraint.Axis.horizontal
        v.distribution = UIStackView.Distribution.fillEqually
        return v
    }()
    
    let row2 : UIStackView = {
        let v = UIStackView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.axis = NSLayoutConstraint.Axis.horizontal
        v.distribution = UIStackView.Distribution.fillEqually
        return v
    }()
    
    let row3 : UIStackView = {
        let v = UIStackView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.axis = NSLayoutConstraint.Axis.horizontal
        v.distribution = UIStackView.Distribution.fillEqually
        return v
    }()
    
    let row4 : UIStackView = {
        let v = UIStackView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.axis = NSLayoutConstraint.Axis.horizontal
        v.distribution = UIStackView.Distribution.fillEqually
        return v
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        setupViews()
        viewLogic()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func viewLogic(){
        if let deleg = delegate {
            deleg.completed(text: values.joined(separator: ""))
        }
    }
    
    func setupViews(){
        
        let pinSize : CGFloat = 14
        
        let pinFieldWrapper1 : UIView = {
            let v = UIView()
            v.translatesAutoresizingMaskIntoConstraints = false
            return v
        }()
        
        let pinFieldWrapper2 : UIView = {
            let v = UIView()
            v.translatesAutoresizingMaskIntoConstraints = false
            return v
        }()
        
        let pinFieldWrapper3 : UIView = {
            let v = UIView()
            v.translatesAutoresizingMaskIntoConstraints = false
            return v
        }()
        
        let pinFieldWrapper4 : UIView = {
            let v = UIView()
            v.translatesAutoresizingMaskIntoConstraints = false
            return v
        }()
        
        let pinField : UIView = {
            let v = UIView()
            v.translatesAutoresizingMaskIntoConstraints = false
            v.layer.cornerRadius = pinSize/2
            v.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            return v
        }()
        
        let pinField2 : UIView = {
            let v = UIView()
            v.translatesAutoresizingMaskIntoConstraints = false
            v.layer.cornerRadius = pinSize/2
            v.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            return v
        }()
        
        let pinField3 : UIView = {
            let v = UIView()
            v.translatesAutoresizingMaskIntoConstraints = false
            v.layer.cornerRadius = pinSize/2
            v.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            return v
        }()
        
        let pinField4 : UIView = {
            let v = UIView()
            v.translatesAutoresizingMaskIntoConstraints = false
            v.layer.cornerRadius = pinSize/2
            v.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            return v
        }()
        
        pinFieldWrapper1.addSubview(pinField)
        pinFieldWrapper2.addSubview(pinField2)
        pinFieldWrapper3.addSubview(pinField3)
        pinFieldWrapper4.addSubview(pinField4)
        
        pinFields.append(pinField)
        pinFields.append(pinField2)
        pinFields.append(pinField3)
        pinFields.append(pinField4)
        
        pinStack.addArrangedSubview(pinFieldWrapper1)
        pinStack.addArrangedSubview(pinFieldWrapper2)
        pinStack.addArrangedSubview(pinFieldWrapper3)
        pinStack.addArrangedSubview(pinFieldWrapper4)
        
        
        
        roundButton1.addTarget(self, action: #selector(handleButtonClicked(_:)), for: .touchUpInside)
        roundButton2.addTarget(self, action: #selector(handleButtonClicked(_:)), for: .touchUpInside)
        roundButton3.addTarget(self, action: #selector(handleButtonClicked(_:)), for: .touchUpInside)
        roundButton4.addTarget(self, action: #selector(handleButtonClicked(_:)), for: .touchUpInside)
        roundButton5.addTarget(self, action: #selector(handleButtonClicked(_:)), for: .touchUpInside)
        roundButton6.addTarget(self, action: #selector(handleButtonClicked(_:)), for: .touchUpInside)
        roundButton7.addTarget(self, action: #selector(handleButtonClicked(_:)), for: .touchUpInside)
        roundButton8.addTarget(self, action: #selector(handleButtonClicked(_:)), for: .touchUpInside)
        roundButton9.addTarget(self, action: #selector(handleButtonClicked(_:)), for: .touchUpInside)
        roundButton0.addTarget(self, action: #selector(handleButtonClicked(_:)), for: .touchUpInside)
        roundButtonCancel.addTarget(self, action: #selector(handleButtonClicked(_:)), for: .touchUpInside)
        roundButtonClear.addTarget(self, action: #selector(handleButtonClicked(_:)), for: .touchUpInside)
        
        row1.addArrangedSubview(buttonWrap1)
        row1.addArrangedSubview(buttonWrap2)
        row1.addArrangedSubview(buttonWrap3)
        
        row2.addArrangedSubview(buttonWrap4)
        row2.addArrangedSubview(buttonWrap5)
        row2.addArrangedSubview(buttonWrap6)
        
        row3.addArrangedSubview(buttonWrap7)
        row3.addArrangedSubview(buttonWrap8)
        row3.addArrangedSubview(buttonWrap9)
        
        row4.addArrangedSubview(buttonWrapCancel)
        row4.addArrangedSubview(buttonWrap0)
        row4.addArrangedSubview(buttonWrapClear)
        
        mainStack.addArrangedSubview(row1)
        mainStack.addArrangedSubview(row2)
        mainStack.addArrangedSubview(row3)
        mainStack.addArrangedSubview(row4)
        
        
        pinContainer.addSubview(pinStack)
        addSubview(pinContainer)
        addSubview(mainStack)
        
        NSLayoutConstraint.activate([
            
            pinContainer.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            pinContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            pinContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            pinContainer.bottomAnchor.constraint(equalTo: mainStack.topAnchor, constant:  -20),
            
            pinStack.heightAnchor.constraint(equalToConstant: 50),
             pinStack.widthAnchor.constraint(equalToConstant: 250),
            pinStack.centerYAnchor.constraint(equalTo: pinContainer.centerYAnchor),
             pinStack.centerXAnchor.constraint(equalTo: pinContainer.centerXAnchor),
            
            mainStack.heightAnchor.constraint(equalToConstant: 400),
            mainStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            mainStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            mainStack.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            row1.heightAnchor.constraint(equalToConstant: 100),
            
            pinField.widthAnchor.constraint(equalToConstant: pinSize),
            pinField.heightAnchor.constraint(equalToConstant: pinSize),
            pinField.centerYAnchor.constraint(equalTo: pinFieldWrapper1.centerYAnchor),
             pinField.centerXAnchor.constraint(equalTo: pinFieldWrapper1.centerXAnchor),
             
             
             pinField2.widthAnchor.constraint(equalToConstant: pinSize),
             pinField2.heightAnchor.constraint(equalToConstant: pinSize),
             pinField2.centerYAnchor.constraint(equalTo: pinFieldWrapper2.centerYAnchor),
             pinField2.centerXAnchor.constraint(equalTo: pinFieldWrapper2.centerXAnchor),
             
             
             pinField3.widthAnchor.constraint(equalToConstant: pinSize),
             pinField3.heightAnchor.constraint(equalToConstant: pinSize),
             pinField3.centerYAnchor.constraint(equalTo: pinFieldWrapper3.centerYAnchor),
             pinField3.centerXAnchor.constraint(equalTo: pinFieldWrapper3.centerXAnchor),
             
             
             pinField4.widthAnchor.constraint(equalToConstant: pinSize),
             pinField4.heightAnchor.constraint(equalToConstant: pinSize),
             pinField4.centerYAnchor.constraint(equalTo: pinFieldWrapper4.centerYAnchor),
             pinField4.centerXAnchor.constraint(equalTo: pinFieldWrapper4.centerXAnchor),
             
            ])
        
    }
    
    @objc func handleButtonClicked(_ sender: AnyObject?){
        let button = sender as! UIButton
        
        if button == roundButtonCancel {
            //Todo: naviagate back
            delegate?.close()
            return
        }
        
        if button == roundButtonClear  {
            if values.count > 0 {
            print(values)
             UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.pinFields[self.values.count - 1].backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            }, completion: {compleetd in })
            
            print("Should clear value")
            values.remove(at: values.count - 1)
                print(values)
                
            }
        }else{
            if values.count < 4 {
                values.append((sender as! UIButton).title(for: .normal)!)
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                    self.pinFields[self.values.count-1].backgroundColor = #colorLiteral(red: 1.0, green: 0.5, blue: 0, alpha: 1.0)
                }, completion: {completed in
                    if completed && self.values.count == 4 {
                        //Todo: call delegate
                        print("Pin layout value")
                        print(self.values.joined(separator: ""))
                    }
                })
                
            }
        }
    }
    
    
}

