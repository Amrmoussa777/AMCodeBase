//
//  ResgisterCollectionViewCell.swift
//  sharex
//
//  Created by Amr Moussa on 15/07/2021.
//  Copyright © 2021 Amr Moussa. All rights reserved.
//

import UIKit

open class ResgisterCollectionViewCell: UICollectionViewCell {
    
   public  static let cellID = "RegisterCellID"
    
   public  let infoLabel = AMItemLable(textAlignment: .center, NoOfLines: 0, size: 15)
    override public init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public init(view:UIView,constrains:NSLayoutConstraint) {
        super.init(frame: .zero)
        //configure(view, constrains: constrains)
        
    }
    open override func prepareForReuse() {
        super.prepareForReuse()
        /* for view in contentView.subviews{
         view.removeFromSuperview()
     } */
       
    }
    
    open func configure(){
        contentView.backgroundColor = .systemBackground
        
        RoundCorners()
        
        contentView.addSubViews(infoLabel)
        
        infoLabel.textColor = .tertiaryLabel

        NSLayoutConstraint.activate([
      
            
            infoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            infoLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -60),
            infoLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            infoLabel.heightAnchor.constraint(equalToConstant: 120),
        
        ])
        
       // registerLabel2.text = "Cell sign up" + String(self.tag)
        
        
    }
    
   open  func addContentViews(_ views:[UIView],constrains:[NSLayoutConstraint],topMessage:String){
        
        infoLabel.text = topMessage
        
        for view in views {
            contentView.addSubview(view)
            contentView.bringSubviewToFront(view)
            view.translatesAutoresizingMaskIntoConstraints  = false
        }
        
        NSLayoutConstraint.activate(constrains)
        layoutIfNeeded()
    }
    
    
}
