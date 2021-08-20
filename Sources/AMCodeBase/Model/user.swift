//
//  user.swift
//  sharex
//
//  Created by Amr Moussa on 06/07/2021.
//  Copyright © 2021 Amr Moussa. All rights reserved.
//

import UIKit


public struct User :Codable{
    public let id:String
    public let userName:String
    public let userRating:Int
    public var avatarUrl:String
    public let email:String
    public let phoneNumber:String
    
    public init(id:String,userName:String,userRating:Int,avatarUrl:String,email:String,phoneNumber:String){
        self.id = id
        self.userName = userName
        self.userRating = userRating
        self.avatarUrl = avatarUrl
        self.email = email
        self.phoneNumber = phoneNumber
    }
}



