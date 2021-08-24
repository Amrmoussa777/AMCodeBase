//
//  ProfileInfoView.swift
//  sharex
//
//  Created by Amr Moussa on 06/08/2021.
//  Copyright © 2021 Amr Moussa. All rights reserved.
//

import UIKit

open class ProfileInfoView: UIView {
    public let firstView = UIView()
    public let secondView = UIView()
    
    public let firstLabelSubHeader = AMItemLable(textAlignment: .center)
    public let secondLabelSubHeader = AMItemLable(textAlignment: .center)
    
   
    public let firstCountLabel = AMItemLable(textAlignment: .center, NoOfLines: 1, size: 25)
    public let secondCoutnLabel = AMItemLable(textAlignment: .center, NoOfLines: 1, size: 25)
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func configure(){
        backgroundColor = .systemGray6
        configureSubView()
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    open func configureSubView(){
        addSubViews(firstView,secondView)
        firstView.translatesAutoresizingMaskIntoConstraints = false
        secondView.translatesAutoresizingMaskIntoConstraints = false
        let padding:CGFloat = 2
        
        NSLayoutConstraint.activate([
        
            firstView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            firstView.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            firstView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding),
            firstView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            
            
            secondView.leadingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: padding),
            secondView.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            secondView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding),
            secondView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding)
        ])
        firstView.backgroundColor = .systemBackground
        secondView.backgroundColor = .systemBackground
        configureFisrtView()
        ConfidureSecondView()
        
    }
    open func configureFisrtView(){
        firstView.addSubViews(firstLabelSubHeader,firstCountLabel)
        firstCountLabel.configureAsProfileHeadline()
        firstLabelSubHeader.textColor = .tertiaryLabel
        
        NSLayoutConstraint.activate([
            firstCountLabel.centerXAnchor.constraint(equalTo: firstView.centerXAnchor),
            firstCountLabel.centerYAnchor.constraint(equalTo: firstView.centerYAnchor,constant: -15),
            firstCountLabel.widthAnchor.constraint(equalTo: firstView.widthAnchor,multiplier: 0.7),
            firstCountLabel.heightAnchor.constraint(equalToConstant: 25),
            
            firstLabelSubHeader.centerXAnchor.constraint(equalTo: firstView.centerXAnchor),
            firstLabelSubHeader.topAnchor.constraint(equalTo: firstCountLabel.bottomAnchor,constant: 10),
            firstLabelSubHeader.widthAnchor.constraint(equalTo: firstView.widthAnchor,multiplier: 0.7),
            firstLabelSubHeader.heightAnchor.constraint(equalToConstant: 15),
        ])
        
        
        
    }
    
    open func setFirstView(subString:String,countLabel:String){
        firstLabelSubHeader.text = subString
        firstCountLabel.text = countLabel
    }
    
    open func ConfidureSecondView(){
        secondView.addSubViews(secondLabelSubHeader,secondCoutnLabel)
        secondCoutnLabel.configureAsProfileHeadline()
        secondLabelSubHeader.textColor = .tertiaryLabel
        
        NSLayoutConstraint.activate([
            secondCoutnLabel.centerXAnchor.constraint(equalTo: secondView.centerXAnchor),
            secondCoutnLabel.centerYAnchor.constraint(equalTo: secondView.centerYAnchor,constant: -15),
            secondCoutnLabel.widthAnchor.constraint(equalTo: secondView.widthAnchor,multiplier: 0.7),
            secondCoutnLabel.heightAnchor.constraint(equalToConstant: 25),
            
            secondLabelSubHeader.centerXAnchor.constraint(equalTo: secondView.centerXAnchor),
            secondLabelSubHeader.topAnchor.constraint(equalTo: secondCoutnLabel.bottomAnchor,constant: 10),
            secondLabelSubHeader.widthAnchor.constraint(equalTo: secondView.widthAnchor,multiplier: 0.7),
            secondLabelSubHeader.heightAnchor.constraint(equalToConstant: 15),
        ])
      
    }
    open func setSecondView(subString:String,countLabel:String){
        secondLabelSubHeader.text = subString
        secondCoutnLabel.text = countLabel
    }
    
    
    
   open  func updateData(firstCount:Int,second:Int){
        firstCountLabel.text = String(firstCount)
        secondCoutnLabel.text = String(second)
    }
}
