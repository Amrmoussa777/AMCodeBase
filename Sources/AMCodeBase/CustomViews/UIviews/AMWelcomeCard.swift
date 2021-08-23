//
//  File.swift
//  
//
//  Created by Amr Moussa on 23/08/2021.
//


import UIKit


open class AMWelcomeCard: UIView {
    
    public let label = UILabel()
    override public init(frame: CGRect) {
        super.init(frame: frame)
        configureLyout()
        
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func configureLyout(){
        addSubViews(label)
        let padding:CGFloat = 10
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            label.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            label.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -padding),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding),
        ])
        label.textAlignment = .center
        RoundCorners()
        backgroundColor = .systemBackground
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    open func setName(name:String,subText:String){
        let headerUserName =  "Hi, \(name) \n "
        let headerAttribute = [ NSAttributedString.Key.foregroundColor: UIColor.darkGray ,
                                 NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 30)  ]
        let headerString = NSAttributedString(string: headerUserName, attributes: headerAttribute)
        
        
        let subTextAttribute = [ NSAttributedString.Key.foregroundColor: UIColor.systemGray2,
                                     NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 20)]
        let subString = NSAttributedString(string: subText, attributes: subTextAttribute)
        
        let combination = NSMutableAttributedString()
        combination.append(headerString)
        combination.append(subString)
        
        label.attributedText = combination
    }
    
    
    
}

