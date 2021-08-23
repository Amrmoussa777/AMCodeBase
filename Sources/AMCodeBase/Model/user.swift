//
//  user.swift
//  sharex
//
//  Created by Amr Moussa on 06/07/2021.
//  Copyright © 2021 Amr Moussa. All rights reserved.
//

import UIKit


public struct User :Codable{
    public let userId:String
    public let userName:String
    public let userRating:Int
    public var avatarUrl:String
    public let email:String
    public let phone:String
    
    
    public init(userId:String,userName:String,userRating:Int,avatarUrl:String,email:String,phone:String){
        self.userId = userId
        self.userName = userName
        self.userRating = userRating
        self.avatarUrl = avatarUrl
        self.email = email
        self.phone = phone
    }
}



