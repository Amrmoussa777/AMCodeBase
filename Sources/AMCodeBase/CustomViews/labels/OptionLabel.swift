//
//  File.swift
//  
//
//  Created by Amr Moussa on 23/08/2021.
//

import UIKit


open class AMOptionLabel :AMItemLable{
    
    
    let padding:CGFloat = 10
    
    open override func configure(_ size: CGFloat) {
        super.configure(size)
        font = UIFont.systemFont(ofSize: size, weight: .semibold)
        textColor = .secondaryLabel
    }
    
    
    
    open override func drawText(in rect: CGRect) {
       
        let insets = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        super.drawText(in: rect.inset(by: insets))
    }
   
    open override var intrinsicContentSize: CGSize{
        get{
            var contentSize = super.intrinsicContentSize
            contentSize.height += padding + padding
            contentSize.width += padding + padding
            return contentSize
        }
    }
    
    
}
