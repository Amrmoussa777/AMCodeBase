//
//  user.swift
//  sharex
//
//  Created by Amr Moussa on 06/07/2021.
//  Copyright © 2021 Amr Moussa. All rights reserved.
//

import UIKit


public struct User :Codable{
    let id:String
    let userName:String
    let userRating:Int
    var avatarUrl:String
    let email:String
    let phoneNumber:String
    
    public init(id:String,userName:String,userRating:Int,avatarUrl:String,email:String,phoneNumber:String){
        self.id = id
        self.userName = userName
        self.userRating = userRating
        self.avatarUrl = avatarUrl
        self.email = email
        self.phoneNumber = phoneNumber
    }
}


