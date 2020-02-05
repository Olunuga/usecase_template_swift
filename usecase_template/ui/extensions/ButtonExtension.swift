//
//  ButtonExtension.swift
//  usecase_template
//
//  Created by OLUNUGA Mayowa on 02/02/2020.
//  Copyright © 2020 OLUNUGA Mayowa. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func addShadow(type: ShadowType){
        self.layer.shadowColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 0.5)
        self.layer.shadowOpacity = 1.0
        self.layer.masksToBounds = false
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        switch type {
        case .normal:
            self.layer.shadowRadius = 0.0
        case .medium:
            self.layer.shadowRadius = 5
        case .ultra:
            self.layer.shadowRadius = 10
        }
    }
    
    func dropShadow(color: CGColor, radius : CGFloat){
        self.layer.shadowColor = color
        self.layer.shadowOpacity = 1.0
        self.layer.masksToBounds = false
        self.layer.shadowRadius = radius
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
    }
    
    func removeDropShadow(){
        self.layer.shadowColor = nil
        self.layer.shadowOpacity = 0
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 0
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    
    func addSpreadShadow(color: CGColor){
        self.layer.shadowColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 0.5)
        self.layer.shadowOpacity = 1.0
        self.layer.masksToBounds = false
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowRadius = 10
    }
    
    /// Helper to get pre transform frame
    var originalFrame: CGRect {
        let currentTransform = transform
        transform = .identity
        let originalFrame = frame
        transform = currentTransform
        return originalFrame
    }
    
    /// Helper to get point offset from center
    func centerOffset(_ point: CGPoint) -> CGPoint {
        return CGPoint(x: point.x - center.x, y: point.y - center.y)
    }
    
    /// Helper to get point back relative to center
    func pointRelativeToCenter(_ point: CGPoint) -> CGPoint {
        return CGPoint(x: point.x + center.x, y: point.y + center.y)
    }
    
    /// Helper to get point relative to transformed coords
    func newPointInView(_ point: CGPoint) -> CGPoint {
        // get offset from center
        let offset = centerOffset(point)
        // get transformed point
        let transformedPoint = offset.applying(transform)
        // make relative to center
        return pointRelativeToCenter(transformedPoint)
    }
    
    var newTopLeft: CGPoint {
        return newPointInView(originalFrame.origin)
    }
    
    var newTopRight: CGPoint {
        var point = originalFrame.origin
        point.x += originalFrame.width
        return newPointInView(point)
    }
    
    var newBottomLeft: CGPoint {
        var point = originalFrame.origin
        point.y += originalFrame.height
        return newPointInView(point)
    }
    
    var newBottomRight: CGPoint {
        var point = originalFrame.origin
        point.x += originalFrame.width
        point.y += originalFrame.height
        return newPointInView(point)
    }
}

extension UIButton {
    func round(text: String){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor =  #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        self.setTitle(text, for: .normal)
        self.setAttributedTitle(NSAttributedString(string: text, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)]), for: .normal)
        self.layer.cornerRadius = 40
        self.showsTouchWhenHighlighted = true
    }
}

enum ShadowType{
    case normal
    case medium
    case ultra
}
