//
//  File.swift
//  
//
//  Created by Amr Moussa on 16/08/2021.
//

import Foundation

public enum  networkError:String,Error {
    case noInternetConnection = "Unable to complete your request. Please check your internet connection."
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data received from the server was invalid. Please try again."
}
