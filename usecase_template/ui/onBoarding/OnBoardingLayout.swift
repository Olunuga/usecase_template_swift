//
//  OnBoardingLayout.swift
//  usecase_template
//
//  Created by OLUNUGA Mayowa on 02/02/2020.
//  Copyright © 2020 OLUNUGA Mayowa. All rights reserved.
//

import Foundation
import UIKit

/*
 Class where all View are setup and arranged.
 */

class OnBoardingLayout : UIView {
    
    //MARK: Properties
    let headerView : UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let topView : UIView  = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints =  false
        return v
    }()
    
    let buttonGroup : UIView  = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints =  false
        return v
    }()
    
    let bottomView : UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
       // v.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        return v
    }()
    
    let registerButton: UIButton = {
        let btn = UIButton()
        btn.setAttributedTitle(NSAttributedString(string: "Gest Started"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.orange
        //btn.addShadow(type: .medium)
        btn.dropShadow(color:#colorLiteral(red: 1.0, green: 0.5, blue: 0.0, alpha: 0.5), radius: 4 )
        btn.titleLabel?.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        btn.layer.cornerRadius = 5
        btn.contentEdgeInsets = UIEdgeInsets.init(top: 15, left: 13, bottom: 15, right: 13)
        return btn
    }()
    
    let loginButton: UIButton = {
        let btn = UIButton()
        btn.setAttributedTitle(NSAttributedString(string: "I have an account"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.white
        btn.titleLabel?.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        btn.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        btn.layer.cornerRadius = 5
        btn.contentEdgeInsets = UIEdgeInsets.init(top: 15, left: 13, bottom: 15, right: 13)
        return btn
    }()
    
    let pageControl : UIPageControl = {
        let pc = UIPageControl()
        pc.numberOfPages = 3
        pc.translatesAutoresizingMaskIntoConstraints = false
        pc.currentPageIndicatorTintColor = UIColor.orange
        pc.pageIndicatorTintColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        return pc
    }()
    
    let headerLabel : UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Welcome to Movie Shangai"
        lb.font =  UIFont.systemFont(ofSize: 24)
        return lb
    }()
    
    let fadeInView : UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        //v.layer.borderColor = #colorLiteral(red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0)
        v.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.5)
        v.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        v.dropShadow(color: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 0.1), radius: 2)
        v.layer.cornerRadius = 5
        v.layer.borderWidth = 2
        //v.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return v
    }()
    
    let fadeInViewImage : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1)
        image.layer.cornerRadius = 25
        return image
    }()
    
    let fadeInViewText : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 3
        label.text = "Tife Just saved 25,000, Join her and get higher interest rates on your savings plan"
        return label
    }()
    
    let flowLayout : UICollectionViewFlowLayout = {
        let cf = UICollectionViewFlowLayout()
        cf.itemSize = CGSize(width: 200, height: 200)
        return cf
    }()
    
    var swipingControls : UICollectionView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setUpViews(){
        flowLayout.scrollDirection = .horizontal
        swipingControls = UICollectionView(frame: CGRect(x: 0, y: 0, width: topView.frame.width, height:  topView.frame.height), collectionViewLayout: flowLayout
        )
        swipingControls?.translatesAutoresizingMaskIntoConstraints = false
        swipingControls!.register(SwipeCell.self, forCellWithReuseIdentifier: "cell")
        swipingControls!.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        swipingControls!.delegate = self
        swipingControls!.dataSource = self
        swipingControls!.isPagingEnabled = true
        swipingControls!.showsHorizontalScrollIndicator = false
        
        //MARK: main Views
        self.addSubview(topView)
        self.addSubview(buttonGroup)
        self.addSubview(headerView)
        self.addSubview(bottomView)
        
        //MARK: inner Views
        headerView.addSubview(headerLabel)
        topView.addSubview(swipingControls!)
        buttonGroup.addSubview(pageControl)
        buttonGroup.addSubview(registerButton)
        buttonGroup.addSubview(loginButton)
        bottomView.addSubview(fadeInView)
        
        fadeInView.addSubview(fadeInViewImage)
        fadeInView.addSubview(fadeInViewText)
        
        
        //MARK: Constraints for main view heirachy
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            headerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            headerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            headerView.bottomAnchor.constraint(equalTo: topView.topAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 100),
            
            topView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            topView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            topView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            topView.bottomAnchor.constraint(equalTo: buttonGroup.topAnchor),
        
            buttonGroup.bottomAnchor.constraint(equalTo: bottomView.topAnchor),
            buttonGroup.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            buttonGroup.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            buttonGroup.topAnchor.constraint(equalTo:topView.bottomAnchor),
            buttonGroup.heightAnchor.constraint(equalToConstant: 200),
            
            bottomView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bottomView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 150),
            ])
        
        
        //MARK: Constraints for headerView
        NSLayoutConstraint.activate([
            headerLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            headerLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            ])
        
        
        //MARK: Constraints for topView
        NSLayoutConstraint.activate([
            swipingControls!.topAnchor.constraint(equalTo: topView.topAnchor),
            swipingControls!.leftAnchor.constraint(equalTo: topView.leftAnchor),
            swipingControls!.rightAnchor.constraint(equalTo: topView.rightAnchor),
            swipingControls!.bottomAnchor.constraint(equalTo: topView.bottomAnchor)
            ])
        
        //MARK: Constraints for buttonGroup
        NSLayoutConstraint.activate([
            pageControl.topAnchor.constraint(equalTo: buttonGroup.topAnchor, constant: 10),
            pageControl.centerXAnchor.constraint(equalTo: buttonGroup.centerXAnchor),
            
            registerButton.topAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: 10),
            registerButton.rightAnchor.constraint(equalTo: buttonGroup.rightAnchor, constant: -20),
            registerButton.leftAnchor.constraint(equalTo: buttonGroup.leftAnchor, constant: 20),
            
            loginButton.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 20),
            loginButton.rightAnchor.constraint(equalTo: buttonGroup.rightAnchor, constant: -20),
            loginButton.leftAnchor.constraint(equalTo: buttonGroup.leftAnchor, constant: 20),
            ])
        
        //MARK: Constraints for bottomView
        NSLayoutConstraint.activate([
            fadeInView.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 20),
             fadeInView.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -20),
            fadeInView.heightAnchor.constraint(equalToConstant: 100),
            fadeInView.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor)
            ])
        
        //MARK: Constraints for fadeInView
        NSLayoutConstraint.activate([
            fadeInViewImage.widthAnchor.constraint(equalToConstant: 50),
            fadeInViewImage.heightAnchor.constraint(equalToConstant: 50),
            fadeInViewImage.centerYAnchor.constraint(equalTo: fadeInView.centerYAnchor),
            fadeInViewImage.leadingAnchor.constraint(equalTo: fadeInView.leadingAnchor,constant: 10),
            
            fadeInViewText.leadingAnchor.constraint(equalTo: fadeInViewImage.trailingAnchor, constant: 10),
            fadeInViewText.centerYAnchor.constraint(equalTo: fadeInView.centerYAnchor),
            fadeInViewText.trailingAnchor.constraint(equalTo: fadeInView.trailingAnchor,constant: -10)
            ])
        
    }
    
}


extension OnBoardingLayout : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
       // cell.backgroundColor = indexPath.item % 2 == 0 ?  .yellow : .red
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: topView.frame.width, height: topView.frame.height)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
    


class SwipeCell : UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        let label : UILabel = {
            let l = UILabel()
            l.translatesAutoresizingMaskIntoConstraints = false
            l.text = "Hello there"
            return l
        }()
        self.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

