//
//  UIimageView+Ext.swift
//  sharex
//
//  Created by Amr Moussa on 02/07/2021.
//  Copyright © 2021 Amr Moussa. All rights reserved.
//

import UIKit

public extension UIImageView {
    
    func downloadImage(fromURL url: String) {
        AMNetworkManager.Shared.downloadImage(from: url) { [weak self] (image) in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.image = image
                self.contentMode = .scaleAspectFill
            }
            
        } 
        
    }
    
    func downloadImageWithAnimation(fromURL url: String,withColor:UIColor) {
        let loading = showImageLoadingLoadingView(color: withColor)
        AMNetworkManager.Shared.downloadImage(from: url) { [weak self] (image) in
            guard let self = self else { return }
            DispatchQueue.main.async {
                loading.removeFromSuperview()
                self.image = image
                self.contentMode = .scaleAspectFill
            }
        }
        
    }
    
    
    func downlaodImagewWithUIimageReturn(fromURL url: String, completed:@escaping (UIImage?)->()) {
        let loading = showImageLoadingLoadingView(color: .systemGreen.withAlphaComponent(0.3) )
        AMNetworkManager.Shared.downloadImage(from: url) { [weak self] (image) in
            guard let self = self else { return }
            DispatchQueue.main.async {
                loading.removeFromSuperview()
                self.image = image
                self.contentMode = .scaleAspectFill
                completed(image)
            }
        }
        
    }
    
    
    
}


