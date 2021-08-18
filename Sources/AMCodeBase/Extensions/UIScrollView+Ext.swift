//
//  File.swift
//  
//
//  Created by Amr Moussa on 18/08/2021.
//

import UIKit

public extension UIScrollView{
    
     func scrollToTop(){
        let topoffset = CGPoint(x: 0, y: 0)
        setContentOffset(topoffset, animated: true)
    }
    
     func scrollToBottom(){
        let bottomOffset = CGPoint(x: 0, y: contentSize.height - bounds.height + contentInset.bottom)
        setContentOffset(bottomOffset, animated: true)
    }
    
}


