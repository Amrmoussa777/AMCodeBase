//
//  ProductAvatar.swift
//  sharex
//
//  Created by Amr Moussa on 19/11/2020.
//  Copyright © 2020 Amr Moussa. All rights reserved.
//

import UIKit

open class AMAvatarImage: UIImageView {
    let ImgPlaceHolder = Images.productImgPlaceholder
    
    public  init(frame: CGRect,tintColor:UIColor = .orange) {
        super.init(frame: frame) 
        configureImageView(newTintColor:tintColor)
    }   
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureImageView(newTintColor:UIColor = .orange){
        layer.cornerRadius = 10
        clipsToBounds = true
        image = ImgPlaceHolder
        contentMode = .center
        tintColor = newTintColor
        translatesAutoresizingMaskIntoConstraints = false
    }
}
