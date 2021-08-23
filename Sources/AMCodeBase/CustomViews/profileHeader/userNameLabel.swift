//
//  userNameLabel.swift
//  sharex
//
//  Created by Amr Moussa on 01/07/2021.
//  Copyright © 2021 Amr Moussa. All rights reserved.
//

import UIKit


open class UserNameLabel: UILabel {
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
     open func configure(){
        textColor = .label
        numberOfLines = 1
        font = UIFont.systemFont(ofSize: 15, weight: .bold)
        translatesAutoresizingMaskIntoConstraints = false
        text = "username"
    }
    
    open func setName(name:String){
        self.text = name.capitalized
    }
    
    
}


open class ProfileUserName:UserNameLabel{
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override open  func configure() {
        super.configure()
        font = UIFont.systemFont(ofSize: 20, weight: .bold)
        textAlignment = .center
    }
    
    
    
}
