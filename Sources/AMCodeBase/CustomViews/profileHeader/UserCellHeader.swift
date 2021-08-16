//
//  CellHeader.swift
//  sharex
//
//  Created by Amr Moussa on 30/06/2021.
//  Copyright © 2021 Amr Moussa. All rights reserved.
//

import UIKit
import SwiftUI

class  UserCellHeader: UIView {
    
    let userAvatar = AvatarImageView()
    let userName   = UserNameLabel()
    lazy var ratingView = RatingUIView()
    let dateLabel  = DateLabel()
    lazy var dotLabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(cellType:cellTypes) {
        super.init(frame: .zero)
        
        switch cellType {
        case .comment:
            configureAsCommentCell()
        case .conversation:
            configureAsConversationCell()
        }
        
    }
    
    
    
    private func configure(){
        addSubViews(userAvatar,userName,
                    ratingView,dateLabel)
        
        translatesAutoresizingMaskIntoConstraints = false
        let padding:CGFloat = 5
        
        NSLayoutConstraint.activate([
            userAvatar.heightAnchor.constraint(equalToConstant: 50),
            userAvatar.widthAnchor.constraint(equalToConstant: 50),
            userAvatar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            userAvatar.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            
            userName.leadingAnchor.constraint(equalTo: userAvatar.trailingAnchor, constant: padding),
            userName.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            userName.heightAnchor.constraint(equalToConstant: 20),
            userName.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            
            ratingView.leadingAnchor.constraint(equalTo: userAvatar.trailingAnchor, constant: 0),
            ratingView.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 2),
            ratingView.heightAnchor.constraint(equalToConstant: 20),
            ratingView.widthAnchor.constraint(equalToConstant: 100),
            
            dateLabel.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            dateLabel.heightAnchor.constraint(equalToConstant: 20),
            dateLabel.widthAnchor.constraint(equalToConstant: 100)
            
            
        ])
        
        
    }
    
    private func configureAsCommentCell(){
        
        addSubViews(userAvatar,userName,
                    dateLabel,dotLabel)
        translatesAutoresizingMaskIntoConstraints = false
        dotLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let padding:CGFloat = 5
        
        NSLayoutConstraint.activate([
            userAvatar.heightAnchor.constraint(equalToConstant: 50),
            userAvatar.widthAnchor.constraint(equalToConstant: 50),
            userAvatar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            userAvatar.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            
            userName.leadingAnchor.constraint(equalTo: userAvatar.trailingAnchor, constant: padding),
            userName.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            userName.heightAnchor.constraint(equalToConstant: 20),
            userName.widthAnchor.constraint(lessThanOrEqualTo: widthAnchor, multiplier: 0.5),
            
            dotLabel.leadingAnchor.constraint(equalTo: userName.trailingAnchor,constant: padding),
            dotLabel.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            dotLabel.widthAnchor.constraint(equalToConstant: 10),
            dotLabel.heightAnchor.constraint(equalToConstant: 20),
            
            dateLabel.centerYAnchor.constraint(equalTo: userName.centerYAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: dotLabel.trailingAnchor, constant: padding),
            dateLabel.heightAnchor.constraint(equalToConstant: 20),
            dateLabel.widthAnchor.constraint(equalToConstant: 100)
            
            
        ])
        
        
        
        
    }
    
    private func configureAsConversationCell(){
        addSubViews(userAvatar,userName,
                    dateLabel)
        
        translatesAutoresizingMaskIntoConstraints = false
        let padding:CGFloat = 5
        
        NSLayoutConstraint.activate([
            userAvatar.heightAnchor.constraint(equalToConstant: 50),
            userAvatar.widthAnchor.constraint(equalToConstant: 50),
            userAvatar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            userAvatar.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            
            
            dateLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            dateLabel.heightAnchor.constraint(equalToConstant: 20),
            dateLabel.widthAnchor.constraint(equalToConstant: 20),
            
            userName.leadingAnchor.constraint(equalTo: userAvatar.trailingAnchor, constant: padding*2),
            userName.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            userName.heightAnchor.constraint(equalToConstant: 20),
            userName.trailingAnchor.constraint(equalTo: dateLabel.leadingAnchor, constant: -padding),
  
        ])
        
        
    }
    
    func set(avatarUrl:String,username:String,
             rating:Int,date:Double){
        userAvatar.downloadImage(fromURL: avatarUrl)
        ratingView.addRating(rating: rating)
        dateLabel.setDate(date: date.getDateStringFromUnixTime())
        userName.setName(name: username)
    }
    


   
    
    
}
