//
//  NetworkManager.swift
//  sharex
//
//  Created by Amr Moussa on 06/07/2021.
//  Copyright © 2021 Amr Moussa. All rights reserved.
//

import UIKit
open class AMNetworkManagerBase :loginStatusProtocol{
    
    private var cashe:[NSString:UIImage] = [:]
    open var baseUrl :String = ""
    open var currentRootVC:UIViewController?
    
  open  var userAuthCompletionHandler:((Bool) -> ())?
    
    public init(baseUrl:String = ""){
        self.baseUrl = baseUrl
    }
    
    open func downloadImage(from url:String,completion:@escaping(UIImage)->()){
        
        let urlKey = NSString(string: url)
        if let cashedImage = cashe[urlKey]{
            completion(cashedImage)
            return
        }
        
        guard let validUrl = URL(string: url) else {return}
        let task = URLSession.shared.dataTask(with: validUrl){(data,respose,error) in
            //check for error
            if let _ = error {}
            
            //check response status
            guard let resonse = respose as?HTTPURLResponse , resonse.statusCode == 200 else{return }
            
            //check if data is Valid
            guard let data = data else{return}
            
            
            guard  let image = UIImage(data: data) else {return}
            self.cashe[urlKey]  = image
            completion(image)
        }
        
        task.resume()
        
    }
    
    
    open func getItems<Item:Decodable>(subUrl:String , completed: @escaping (Result<[Item], networkError>) -> Void) {
        let endpoint = baseUrl + subUrl
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.noInternetConnection))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                completed(.failure(.noInternetConnection))
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Item].self, from: data)
                completed(.success(followers))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    open func checkEmailExist(email:String,compledted: @escaping(Bool)->()){}
    open func favButtonLiked(itemID:String,compledted: @escaping(Bool)->()){}
    open func favButtondisLiked(itemID:String,compledted: @escaping(Bool)->()){}
    open func signUpUser(user:User,password:String,completed:@escaping(Bool)->()){}
    open func signInUSer(email:String,pass:String,completed:@escaping(Bool)->()){}
    open func itemLikedOrNot(itemID:String,completed:@escaping(Bool)->()){}
    open func getCurrentUserInfo(completed:@escaping(User)->()){}
    
   
    
    open func authenticateUser(completion:@escaping(Bool)->()){
        self.userAuthCompletionHandler = completion
        currentRootVC?.presentLoginVC(delegateHandler: self)
    }
    
    open func userLoginStatusChanged(ststus: userLoginStatus) {
        switch (ststus) {
        case .loggedin:
            self.userAuthCompletionHandler?(true)
        case .tappLogin:
            currentRootVC?.presentLoginVC(delegateHandler: self)
        case .tappedRegisterButton:
            currentRootVC?.showRegisterVC(delegateHandler: self)
        case .registered:
            print("registered")
            self.userAuthCompletionHandler?(true)
        // handle action veforesign up
        }
    }
    
    open func memoryWarningReceived(){
        NSLog("amrLogg:\(cashe.count)")
        cashe.removeAll()
    }
    
    
    
}//c





open class AMNetworkManager: AMNetworkManagerBase {
    public static let Shared = AMNetworkManager()
    private init(){ super.init()}
}

   

