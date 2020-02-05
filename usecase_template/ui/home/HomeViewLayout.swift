//
//  HomeViewLayout.swift
//  usecase_template
//
//  Created by OLUNUGA Mayowa on 03/02/2020.
//  Copyright © 2020 OLUNUGA Mayowa. All rights reserved.
//

import Foundation
import UIKit

protocol SwipeAnimationProtocol {
    func completed(completed: Bool)-> Void
}

class HomeViewLayout : UIView {
    var sheetOpened = false
    var parentHeight : CGFloat?
    var sheetHeight : CGFloat = 0
    var sheetClosedHeight: CGFloat = 0
    var yPosition : CGFloat = 0
    var xPosition : CGFloat = 0
    var delegate : SwipeAnimationProtocol?
    
    let bottomSheet : UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        v.dropShadow(color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), radius: 10)
        v.layer.cornerRadius = 20
        return v
    }()
    
    let sheetHead : UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 4
        v.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return v
    }()
    
    let scrollView : UIScrollView = {
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let terms : UILabel = {
        let v = UILabel()
        v.numberOfLines = 0
        v.textAlignment = NSTextAlignment.justified
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let swipeToAgreeParent : UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        v.layer.borderWidth = 2
        v.layer.cornerRadius = 30
        v.layer.borderColor = #colorLiteral(red: 1.0, green: 0.5, blue: 0.0, alpha: 1)
        return v
    }()
    
    let swipeToAgreeParentCopy : UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.dropShadow(color: #colorLiteral(red: 1.0, green: 0.5, blue: 0.0, alpha: 0.5), radius: 10)
        v.layer.borderWidth = 2
        v.layer.cornerRadius = 30
        v.layer.borderColor = #colorLiteral(red: 1.0, green: 0.5, blue: 0.0, alpha: 1)
        return v
    }()
    
    
    let swipeToAgreeChild : UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = #colorLiteral(red: 1.0, green: 0.5, blue: 0.0, alpha: 1)
        v.layer.cornerRadius = 28
        return v
    }()
    
    let swipeToAgreeHandle : UIView  = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 25
        v.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        return v
    }()
    
    let swipeToAgreeLabel : UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.text = "Swipe to agree and continue"
        v.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        v.font = UIFont.boldSystemFont(ofSize: 16)
        return v
    }()
    
    let acceptedLabel : UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.alpha = 0
        v.text = "Accepted"
        v.textColor = #colorLiteral(red: 1.0, green: 0.5, blue: 0.0, alpha: 1)
        v.font = UIFont.boldSystemFont(ofSize: 16)
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 0.9722703223, green: 0.9792027417, blue: 1, alpha: 1)
        setUpViews()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews(){
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 1.4
        paragraphStyle.alignment = NSTextAlignment.justified
        
        let attrString = NSMutableAttributedString(string: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur consequat id urna vel dapibus. Etiam placerat in justo eu consequat. Vivamus consequat quam vel risus fermentum, at convallis quam vestibulum. Duis mi tortor, congue at feugiat nec, consectetur sed ligula. Praesent vitae gravida mi. Aliquam ut ex sed eros commodo feugiat vel id arcu. Nunc tempor feugiat diam, sit amet facilisis enim faucibus sed. Nunc euismod velit a metus interdum tincidunt. In hac habitasse platea dictumst. Sed tempus libero ut finibus tincidunt.")
        
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attrString.length))
        
        terms.attributedText = attrString
        
        let dragGestureRecogniser = UIPanGestureRecognizer(target: self, action: #selector(handleDrag(_:)))
        dragGestureRecogniser.minimumNumberOfTouches = 1
        
        let swipeGsture = UIPanGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        swipeGsture.minimumNumberOfTouches = 1
        
        swipeToAgreeHandle.addGestureRecognizer(swipeGsture)
        
        swipeToAgreeHandle.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        
        bottomSheet.addSubview(sheetHead)
        bottomSheet.addSubview(terms)
        swipeToAgreeChild.addSubview(swipeToAgreeHandle)
        swipeToAgreeChild.addSubview(swipeToAgreeLabel)
        swipeToAgreeParentCopy.addSubview(swipeToAgreeParent)
        swipeToAgreeParent.addSubview(acceptedLabel)
        swipeToAgreeParent.addSubview(swipeToAgreeChild)
        bottomSheet.addSubview(swipeToAgreeParentCopy)
        bottomSheet.addGestureRecognizer(dragGestureRecogniser)
        addSubview(bottomSheet)
    
        //mask.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.0)
        
        //swipeToAgreeParent.mask = swipeMask
        
        NSLayoutConstraint.activate([
            bottomSheet.widthAnchor.constraint(equalTo: widthAnchor),
            bottomSheet.bottomAnchor.constraint(equalTo: bottomAnchor, constant: +20),
           // bottomSheet.heightAnchor.constraint(equalToConstant: 700),
            
            sheetHead.widthAnchor.constraint(equalToConstant: 50),
            sheetHead.heightAnchor.constraint(equalToConstant: 6),
            sheetHead.centerXAnchor.constraint(equalTo: bottomSheet.centerXAnchor),
            sheetHead.topAnchor.constraint(equalTo: bottomSheet.topAnchor, constant: 10),
            
            terms.topAnchor.constraint(equalTo: sheetHead.bottomAnchor, constant: 10),
            terms.leadingAnchor.constraint(equalTo: bottomSheet.leadingAnchor, constant: 16),
            terms.trailingAnchor.constraint(equalTo: bottomSheet.trailingAnchor, constant:  -16),
            
            
            swipeToAgreeParentCopy.leadingAnchor.constraint(equalTo: bottomSheet.leadingAnchor, constant: 16),
            swipeToAgreeParentCopy.trailingAnchor.constraint(equalTo: bottomSheet.trailingAnchor, constant: -16),
            swipeToAgreeParentCopy.bottomAnchor.constraint(equalTo: bottomSheet.bottomAnchor, constant: -50),
        swipeToAgreeParentCopy.heightAnchor.constraint(equalToConstant: 60),
            
            swipeToAgreeParent.leadingAnchor.constraint(equalTo: swipeToAgreeParentCopy.leadingAnchor),
            swipeToAgreeParent.trailingAnchor.constraint(equalTo: swipeToAgreeParentCopy.trailingAnchor),
            swipeToAgreeParent.bottomAnchor.constraint(equalTo: swipeToAgreeParentCopy.bottomAnchor),
            swipeToAgreeParent.heightAnchor.constraint(equalToConstant: 60),
            
            
            swipeToAgreeChild.leadingAnchor.constraint(equalTo: swipeToAgreeParent.leadingAnchor , constant:  2),
            swipeToAgreeChild.trailingAnchor.constraint(equalTo: swipeToAgreeParent.trailingAnchor , constant: -2),
            swipeToAgreeChild.topAnchor.constraint(equalTo: swipeToAgreeParent.topAnchor , constant: 2),
             swipeToAgreeChild.bottomAnchor.constraint(equalTo: swipeToAgreeParent.bottomAnchor , constant: -2),
             
             acceptedLabel.centerXAnchor.constraint(equalTo: swipeToAgreeParent.centerXAnchor),
             acceptedLabel.centerYAnchor.constraint(equalTo: swipeToAgreeParent.centerYAnchor),
             
             
             
             swipeToAgreeHandle.topAnchor.constraint(equalTo: swipeToAgreeChild.topAnchor, constant: 4),
             swipeToAgreeHandle.leadingAnchor.constraint(equalTo: swipeToAgreeChild.leadingAnchor, constant:  4),
            swipeToAgreeHandle.heightAnchor.constraint(equalToConstant: 50),
            swipeToAgreeHandle.widthAnchor.constraint(equalToConstant: 50),
            
            swipeToAgreeLabel.centerYAnchor.constraint(equalTo: swipeToAgreeChild.centerYAnchor),
             swipeToAgreeLabel.centerXAnchor.constraint(equalTo: swipeToAgreeChild.centerXAnchor),
            ])
        
        //swipeToAgreeParent.mask = swipeMask
        swipeToAgreeParent.layer.masksToBounds = true
        
    }
    
    
    
    func updateView(){
        
        guard parentHeight != nil else {
            return
        }
        
        //set sheet height to 90% of the device height
        sheetHeight = (90/100) * parentHeight!
        sheetClosedHeight = sheetHeight - 100
        yPosition = sheetHeight - 100
        
    
        NSLayoutConstraint.activate([
            bottomSheet.widthAnchor.constraint(equalTo: widthAnchor),
            bottomSheet.bottomAnchor.constraint(equalTo: bottomAnchor, constant: +10),
            bottomSheet.heightAnchor.constraint(equalToConstant: sheetHeight),
            
            sheetHead.widthAnchor.constraint(equalToConstant: 70),
            sheetHead.heightAnchor.constraint(equalToConstant: 8),
            sheetHead.centerXAnchor.constraint(equalTo: bottomSheet.centerXAnchor),
            sheetHead.topAnchor.constraint(equalTo: bottomSheet.topAnchor, constant: 10)
            ])
        
        self.bottomSheet.transform = CGAffineTransform(translationX: 0, y: parentHeight!)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.bottomSheet.transform = CGAffineTransform(translationX: 0, y: self.sheetClosedHeight)
        })
    }
    
    @objc func handleDrag(_ gestureRecognizer: UIPanGestureRecognizer){
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
            let translation = gestureRecognizer.translation(in: self)
            yPosition =  yPosition + translation.y
            
            if translation.y > 2 {
                closeSheet()
            }
            
            if translation.y < -2 {
                openSheet()
            }
            
//            //reset sheet transform position in view
//            if yPosition < 11 {
//                yPosition = 11
//            }
//
//             //reset sheet transform position in view
//            if (yPosition > (sheetClosedHeight - 1)) {
//                yPosition = sheetClosedHeight - 1
//            }
            
//            if yPosition > 10 && yPosition < sheetClosedHeight
//            {
//                self.bottomSheet.transform = CGAffineTransform(translationX: 0, y: yPosition)
//            }
            
        }
    
    }
    
    @objc func handleSwipe(_ gestureRecognizer: UIPanGestureRecognizer){
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
            let translation = gestureRecognizer.translation(in: self)
            
            print("Swipping")
            print(swipeToAgreeParent.frame.width)
            print(translation.x)
            print("current x position \(xPosition)")
            xPosition =  xPosition + translation.x
//
//            //reset sheet transform position in view
//            if xPosition < 1 {
//                xPosition = 1
//            }
//
//            //reset sheet transform position in view
//            if (xPosition > (swipeToAgreeParent.frame.width - 50 - 1)) {
//                xPosition = swipeToAgreeParent.frame.width - 50 - 1
//            }
            
             print("current x position \(xPosition)")
            
            //open animation
                if translation.x > 0{
                    UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                        self.swipeToAgreeChild.transform = CGAffineTransform(translationX: self.swipeToAgreeParent.frame.width - self.swipeToAgreeHandle.frame.width - 5 - 4, y: 0)
                    }, completion: {
                        completed in
                        if completed {
                            UIView.animate(withDuration: 2, delay: 1, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                                self.acceptedLabel.alpha = 1
                            }, completion: {
                                completed in
                                if completed {
                                    if let completedProtocol = self.delegate {
                                completedProtocol.completed(completed: true)
                                    }
                                }
                                
                            })
                        }
                       
                        
                    })
                }
            
            //close animation
                if translation.x < -2 {
                    UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                        self.swipeToAgreeChild.transform = CGAffineTransform(translationX: 0, y: 0)
                    })
                }
            
            
        }
    }
    
    func toggleSheet(){
        if sheetOpened {
             sheetOpened = false
            //closeSheet()
        }else{
            sheetOpened = true
           // openSheet()
        }
    }
    
   fileprivate func openSheet(){
        debugPrint("Opening sheet...")
    
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.bottomSheet.transform = CGAffineTransform(translationX: 0, y: 0)
        })
    }
    
  fileprivate func closeSheet(){
        debugPrint("Closing sheet...")
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.bottomSheet.transform = CGAffineTransform(translationX: 0, y:self.sheetClosedHeight)
        })
    }
}
