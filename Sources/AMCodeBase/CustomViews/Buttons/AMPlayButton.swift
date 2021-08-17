//
//  File.swift
//  
//
//  Created by Amr Moussa on 17/08/2021.
//

import UIKit


open class AMPLayButton: AMButton {
    
    
    override public init(text: String, bGColor: UIColor, iconImage: UIImage? = Images.bagImage) {
        super.init(text: text, bGColor: bGColor, iconImage: iconImage)
        configure()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0 )
    }
    
}
