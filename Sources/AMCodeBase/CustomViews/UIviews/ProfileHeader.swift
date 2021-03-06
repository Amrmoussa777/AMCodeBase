//
//  ProfileHeader.swift
//  sharex
//
//  Created by Amr Moussa on 04/08/2021.
//  Copyright © 2021 Amr Moussa. All rights reserved.
//

import UIKit


open class ProfileHeader: UIView {
    
   public let imageView = AvatarImageView()
   public let nameLabel = ProfileUserName()
   public let ratingView  = RatingUIView()
   public let phoneNumberLabel = AMItemLable(textAlignment: .center, NoOfLines: 1, size: 15)
    
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
        
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func configureLayout(){
        addSubViews(imageView,nameLabel,ratingView,phoneNumberLabel)
        let padding:CGFloat = 10
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 150),
            imageView.heightAnchor.constraint(equalToConstant: 150),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: -75),
            
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: padding),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            nameLabel.heightAnchor.constraint(equalToConstant: 30),
           
            ratingView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            ratingView.centerXAnchor.constraint(equalTo: centerXAnchor),
            ratingView.heightAnchor.constraint(equalToConstant: 20),
            ratingView.widthAnchor.constraint(equalToConstant: 100),
            
            phoneNumberLabel.topAnchor.constraint(equalTo: ratingView.bottomAnchor),
            phoneNumberLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            phoneNumberLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            phoneNumberLabel.heightAnchor.constraint(equalToConstant: 20),
            
        ])
        
        phoneNumberLabel.textColor = .tertiaryLabel
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    open func setData(user:User){
        imageView.downloadImage(fromURL: user.avatarUrl)
        nameLabel.setName(name: user.name)
        phoneNumberLabel.setText(text: user.phone)
        ratingView.addRating(rating: user.userRating)
    }
    
    
}
