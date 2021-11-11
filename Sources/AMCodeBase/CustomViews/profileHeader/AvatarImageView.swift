//
//  AvatarImageView.swift
//  sharex
//
//  Created by Amr Moussa on 01/07/2021.
//  Copyright © 2021 Amr Moussa. All rights reserved.
//

import UIKit

open class AvatarImageView: UIImageView {
    
   // let cache = NetworkManager.shared.cache


    override public  init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required public  init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public init(){
        super.init(frame: .zero)
        configure()
    }
    
    open func configure() {
        layer.cornerRadius = 10
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    open func setImage(image:UIImage?){
        self.image = image
    }
    
  
}
