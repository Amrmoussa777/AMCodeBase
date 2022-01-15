//
//  File.swift
//  
//
//  Created by Amr Moussa on 08/01/2022.
//

import UIKit


public extension UILabel {
    func setMBSettingAtrributedText(fString:String,lString:String)->NSAttributedString{
        font = UIFont.systemFont(ofSize: 17, weight: .regular)
        let attrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 20)]
       
        let attributedString = NSMutableAttributedString(string:fString)
        let dotString = NSMutableAttributedString(string: "\u{2022} ", attributes:attrs)
        let boldString = NSMutableAttributedString(string: lString, attributes:attrs)
        
        
        dotString.append(attributedString)
        dotString.append(boldString)
        textColor = .black
        return dotString
    }
    
    
    func  setMBSettingAtrributedText(fString:String,lString:String,IMG:UIImage)->NSAttributedString{
        let attachment = NSTextAttachment()
        attachment.image = IMG.withTintColor(.systemGreen)
        attachment.bounds = CGRect(x: 0, y: 0, width: 30, height: 17)
        let attachmentStr = NSAttributedString(attachment: attachment)
        
        font = UIFont.systemFont(ofSize: 17, weight: .regular)
        let attrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 20)]
        
        let attributedString = NSMutableAttributedString(string:fString)
        let dotString = NSMutableAttributedString(string: "", attributes:attrs)
        let boldString = NSMutableAttributedString(string: lString, attributes:attrs)
        
        dotString.append(attachmentStr)
        dotString.append(attributedString)
        dotString.append(boldString)
        textColor = .black
        return dotString
    }
    
    
    func  setMBSettingAtrributedTextInTheEndOfText(fString:String,lString:String,IMG:UIImage)->NSAttributedString{
        let attachment = NSTextAttachment()
        attachment.image = IMG.withTintColor(.black)
        attachment.bounds = CGRect(x: 0, y: 0, width: 30, height: 17)
        let attachmentStr = NSAttributedString(attachment: attachment)
        
        font = UIFont.systemFont(ofSize: 17, weight: .regular)
        let attrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 20)]
        
        let attributedString = NSMutableAttributedString(string:fString)
        let dotString = NSMutableAttributedString(string:  "\u{2022} ", attributes:attrs)
        let boldString = NSMutableAttributedString(string: lString, attributes:attrs)
        
       
        dotString.append(attributedString)
        dotString.append(boldString)
        dotString.append(attachmentStr)
        textColor = .black
        return dotString
    }


    func getSUNameAttributedText(name:String,time:String)->NSAttributedString{
        // create UIlabel attributed text documentaion
        font = UIFont.systemFont(ofSize: 17, weight: .regular)
        let attrs = [NSAttributedString.Key.foregroundColor : UIColor.systemGray4,
                     NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12)]
        let attributedString = NSMutableAttributedString(string:name + " ")
        let timeString = NSMutableAttributedString(string: time, attributes:attrs)
        attributedString.append(timeString)
        return attributedString
}
}
