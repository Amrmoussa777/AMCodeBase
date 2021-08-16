//
//  ShareTextView.swift
//  sharex
//
//  Created by Amr Moussa on 02/08/2021.
//  Copyright © 2021 Amr Moussa. All rights reserved.
//

//
//  shareTextFeild.swift
//  sharex
//
//  Created by Amr Moussa on 15/07/2021.
//  Copyright © 2021 Amr Moussa. All rights reserved.
//

import UIKit

                
open class AMTextView:UITextView{
    
    lazy var originalPassword = ""
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
    }
    
  
    
   public init(placeHolder:String,placeholderImage:UIImage) {
        super.init(frame: .zero, textContainer: nil)
        configure(placeHolder,placeholderImage)
        
        
    }
    
   public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure(_ plaHolder:String,_ placeHolderImage:UIImage){
        textAlignment = .left
        RoundCorners()
        AddStroke(color: .systemGray6)
        translatesAutoresizingMaskIntoConstraints = false
        
        
    }
   
    
}
