//
//  UIVC+Ext.swift
//  sharex
//
//  Created by Amr Moussa on 30/06/2021.
//  Copyright © 2021 Amr Moussa. All rights reserved.
//

import UIKit

public extension UIViewController{
    
    
  
    
   @objc  func rightBarItemTapped(){
        //handle accoutn icon tapped
        let accountVC = CurentUserProfile()
        accountVC.parentVC = self
        present(accountVC, animated: true)
        
    
    }
    
    @objc func dissmisVC(){
       dismiss(animated: true)
    
     }
    
    
    
    
    
    //var containerView: UIView!
    
    func showLoadingView() -> UIView {
        let containerView = UIView(frame: view.bounds)
        view.addSubview(containerView)
        
        containerView.backgroundColor = .systemBackground
        containerView.alpha = 0
        
        UIView.animate(withDuration: 0.25) { containerView.alpha = 0.8 }
        
        let activityIndicator = UIActivityIndicatorView(style: .large)
        containerView.addSubview(activityIndicator)
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
        
        activityIndicator.startAnimating()
        return containerView
    }
    
    func dismissLoadingView(view:UIView) {
        DispatchQueue.main.async {
            view.removeFromSuperview()
        }
    }
    
    func presentLoginVC(delegateHandler:loginStatusProtocol){
//        let loginVC  = LoginVC()
//        loginVC.delegate = delegateHandler
//        present(loginVC, animated: true)
        
    }
    func showRegisterVC(delegateHandler:loginStatusProtocol){
//        let registerVC = RegisterVC.shared
//           registerVC.delegate = delegateHandler
//        present(registerVC, animated: true)
    }
   
   
    
    

    
}


