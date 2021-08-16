//
//  CollectionViewCell.swift
//  sharex
//
//  Created by Amr Moussa on 02/07/2021.
//  Copyright © 2021 Amr Moussa. All rights reserved.
//

import UIKit

open class AMImageSliderCell: UICollectionViewCell {
    
    
    static let cellID = "imageSliderCellID"
    let imageView = UIImageView()
    
    
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func configure(){
        imageView.image = Images.sliderImgPlaceholder
        imageView.contentMode = .center
        imageView.tintColor = .orange
        addSubview(imageView)
        imageView.pinToSuperViewEdges(in:self)
        backgroundColor  = .systemBackground
    }
    
    func setImage(img:String){
        AMNetworkManager.Shared.downloadImage(from: img) { img in
            DispatchQueue.main.async {
                
                self.imageView.image = img
                self.imageView.contentMode = .scaleAspectFit

            }
        }
        
    }
    func setImage(img:UIImage){
        DispatchQueue.main.async {
            self.imageView.image = img
            self.imageView.contentMode = .scaleAspectFit
        }
       
    }
    
    
}
