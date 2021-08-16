//
//  MessageCell.swift
//  sharex
//
//  Created by Amr Moussa on 30/07/2021.
//  Copyright © 2021 Amr Moussa. All rights reserved.
//

import UIKit


open class SenderMessageCell<MessageT>:UICollectionViewCell{
    
    // dont forget to add static cellID
    
    let messageLabel    = MessageLabel()
    let dateLabel     = ShareDateLabel()
    lazy var statusImage = AvatarImageView()
    
    let padding:CGFloat = 10
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLayout(){
        addSubViews(messageLabel,dateLabel)
        
        
        NSLayoutConstraint.activate([
            
            dateLabel.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            dateLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            dateLabel.widthAnchor.constraint(equalToConstant: 250 ),
            dateLabel.heightAnchor.constraint(equalToConstant: 20 ),
            
            messageLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 5),
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            messageLabel.widthAnchor.constraint(lessThanOrEqualTo: widthAnchor, multiplier: 0.7),
            messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
   open  func setMessage(message:MessageT){}
    
    open func sendMessage(message:MessageT,conversationID:String){}
    
    
    public func messageNotUploaded(){
        addSubview(statusImage)
        NSLayoutConstraint.activate([
            statusImage.centerYAnchor.constraint(equalTo: messageLabel.centerYAnchor),
            statusImage.trailingAnchor.constraint(equalTo: messageLabel.leadingAnchor, constant: -padding),
            
            statusImage.widthAnchor.constraint(equalToConstant: 20),
            statusImage.heightAnchor.constraint(equalToConstant: 20),
        ])
        statusImage.setImage(image:  Images.faildAndReloadImage!)
        statusImage.backgroundColor = .red
        statusImage.tintColor = .white
    }
}

open class ReceiverMessageCell<messageT>:UICollectionViewCell{
    
    // dont forget to add static cellID
    
    let userAvatar      = AvatarImageView()
    let messageLabel    = MessageLabel()
    let dateLabel     = ShareDateLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
    private func configureLayout(){
        addSubViews(userAvatar,messageLabel,dateLabel)
        let padding:CGFloat = 10
        
        NSLayoutConstraint.activate([
            
            dateLabel.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            dateLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            dateLabel.widthAnchor.constraint(equalToConstant: 250 ),
            dateLabel.heightAnchor.constraint(equalToConstant: 20 ),
            
            userAvatar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            userAvatar.topAnchor.constraint(equalTo: dateLabel.bottomAnchor),
            userAvatar.widthAnchor.constraint(equalToConstant: 50),
            userAvatar.heightAnchor.constraint(equalToConstant: 50),
            
            messageLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 5),
            messageLabel.leadingAnchor.constraint(equalTo: userAvatar.trailingAnchor, constant: padding),
            messageLabel.widthAnchor.constraint(lessThanOrEqualTo: widthAnchor, multiplier: 0.7),
            messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
      
        ])
    }
    
    open func setMessage(message:messageT){}
    
    open func getSenderInfos(message:messageT){}
    
}
