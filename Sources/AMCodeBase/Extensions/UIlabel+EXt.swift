//
//  File.swift
//  
//
//  Created by Amr Moussa on 08/01/2022.
//

import UIKit


extension UILabel {
    func setMBSettingAtrributedText(fString:String,lString:String)->NSAttributedString{
        font = UIFont.systemFont(ofSize: 15, weight: .thin)
        
        let attributedString = NSMutableAttributedString(string:"\u{2022} "+fString)

        let attrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)]
        let boldString = NSMutableAttributedString(string: lString, attributes:attrs)
        
        attributedString.append(boldString)
        
        return attributedString
    }

}
