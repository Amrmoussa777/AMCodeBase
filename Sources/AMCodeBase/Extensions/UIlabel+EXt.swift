//
//  File.swift
//  
//
//  Created by Amr Moussa on 08/01/2022.
//

import UIKit


public extension UILabel {
    func setMBSettingAtrributedText(fString:String,lString:String)->NSAttributedString{
        font = UIFont.systemFont(ofSize: 20, weight: .regular)
        let attrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 25)]
       
        let attributedString = NSMutableAttributedString(string:fString)
        let dotString = NSMutableAttributedString(string: "\u{2022} ", attributes:attrs)
        let boldString = NSMutableAttributedString(string: lString, attributes:attrs)
        
        
        dotString.append(attributedString)
        dotString.append(boldString)
        textColor = .black
        return dotString
    }

}
