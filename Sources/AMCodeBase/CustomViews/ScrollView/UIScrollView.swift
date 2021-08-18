//
//  File.swift
//  
//
//  Created by Amr Moussa on 18/08/2021.
//
import UIKit

open class AMScrollView: UIScrollView {
    
    open var contentView = UIView()
    open var contentViewSize:CGSize = CGSize(width: 0, height: 0)
    
    public init (contentViewSize:CGSize){
        super.init(frame: .zero)
        self.contentViewSize = contentViewSize
        configure()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        addSubview(contentView)
        contentView.pinToSuperViewEdges(in: self)
        
        NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(equalToConstant: contentViewSize.height),
            contentView.widthAnchor.constraint(equalToConstant: contentViewSize.width)
        ])
    }
    open func addContent(){
        
    }
    
}

