//
//  Constants.swift
//  sharex
//
//  Created by Amr Moussa on 19/11/2020.
//  Copyright © 2020 Amr Moussa. All rights reserved.
//

import UIKit

public enum TabbarImages{
    public static let homeTabbarItemImage = UIImage(systemName: "house")
    public static let groupTabbarItemImage = UIImage(systemName: "person.3")
    public static let chatTabbarItemImage = UIImage(systemName: "message")
    public static let ordersTabbarItemImage = UIImage(systemName: "cart")
    public static let accountnavbaritem = UIImage(systemName: "person.circle")

}
public enum Images {
   public static let productImgPlaceholder = UIImage(systemName: "photo.fill")
   public static let sliderImgPlaceholder = UIImage(systemName: "photo.on.rectangle.angled")
   public static let notFavImage =  UIImage(systemName: "heart")
   public static let FavImage =  UIImage(systemName: "heart.fill")
   public static let bagImage = UIImage(systemName: "bag")
   public static let commCountImage = UIImage(systemName: "person.2")
   public static let soldcountImage = UIImage(systemName: "cart")
   public static let avatarPlaceholer = UIImage(named:"userAvatar")
   public static let commInfoImage = UIImage(systemName: "person.3")
   public static let commentImage = UIImage(systemName: "text.bubble")
   public static let shareImage = UIImage(systemName: "arrowshape.turn.up.forward")
   public static let errorButton = UIImage(systemName: "checkmark.shield.fill")
    
    public static let emailImage = UIImage(systemName: "envelope")
    public static let passwordImage = UIImage(systemName: "lock.shield" )
    public static let userNameImage = UIImage(systemName: "person")
    public static let phoneImage = UIImage(systemName: "phone")
    public static let plusImage = UIImage(systemName: "plus")
    public static let checkMarkImage = UIImage(systemName: "checkmark.circle")
    public static let sendImage = UIImage(systemName: "paperplane")
    public static let swriteImage = UIImage(systemName: "pencil")
    public static let faildAndReloadImage = UIImage(systemName: "arrow.counterclockwise")
    public static let dollarSign = UIImage(systemName: "dollarsign.circle")

    public static let nextButton = UIImage(systemName: "arrow.forward" )
    public static let logOut = UIImage(systemName: "arrow.left" )
    
    // need to be specified in your assets.
    static let loginImage = UIImage(named: "loginAvatar")
    static let registerImage = UIImage(named: "registerAvatar")
    static let createNewProductAvatar = UIImage(named: "createNewProductAvatar")
    
}

public enum AlertImages{
    
    public static let lockImage = UIImage(systemName: "lock")
    public static let unlockImage = UIImage(systemName: "lock.open")
    public static let registerImage = UIImage(systemName: "arrow.up.doc.fill")
}
public enum  alertMessages:String,Error {
    case noUserFound = "Proceeed to sign In"
  
}


public enum ProdcutCardTypes{
    case communityCount
    case soldCount
}



public enum userLoginStatus {
    case loggedin
    case tappedRegisterButton
    case registered
}



public enum ScreenSize {
    public static let width = UIScreen.main.bounds.size.width
    public static let height = UIScreen.main.bounds.size.height
    public static let maxLength = max(ScreenSize.width, ScreenSize.height)
    public static let minLength = min(ScreenSize.width, ScreenSize.height)
}

public enum DeviceTypes {
    public static let idiom                    = UIDevice.current.userInterfaceIdiom
    public static let nativeScale              = UIScreen.main.nativeScale
    public static let scale                    = UIScreen.main.scale
    
    public static let isiPhoneSE               = idiom == .phone && ScreenSize.maxLength == 568.0
    public static let isiPhone8Standard        = idiom == .phone && ScreenSize.maxLength == 667.0 && nativeScale == scale
    public static let isiPhone8Zoomed          = idiom == .phone && ScreenSize.maxLength == 667.0 && nativeScale > scale
    public static let isiPhone8PlusStandard    = idiom == .phone && ScreenSize.maxLength == 736.0
    public static let isiPhone8PlusZoomed      = idiom == .phone && ScreenSize.maxLength == 736.0 && nativeScale < scale
    public static let isiPhoneX                = idiom == .phone && ScreenSize.maxLength == 812.0
    public static let isiPhoneXsMaxAndXr       = idiom == .phone && ScreenSize.maxLength == 896.0
    public static let isiPad                   = idiom == .pad && ScreenSize.maxLength >= 1024.0
    public static let isSmallSEAndMini       = idiom == .phone && ScreenSize.maxLength <= 667.0 && nativeScale == scale
    
    public static func isiPhoneXAspectRatio() -> Bool {
        return isiPhoneX || isiPhoneXsMaxAndXr
    }
}


public enum cellTypes {
     case comment
    case conversation
}

