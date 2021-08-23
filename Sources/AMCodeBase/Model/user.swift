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
    public let yearId:Int
    public let token:String
    
    public init(userId:String,userName:String,userRating:Int,avatarUrl:String,email:String,phone:String
                ,yearId:Int,token:String){
        self.userId = userId
        self.userName = userName
        self.userRating = userRating
        self.avatarUrl = avatarUrl
        self.email = email
        self.phone = phone
        self.yearId = yearId
        self.token = token
    }
}



