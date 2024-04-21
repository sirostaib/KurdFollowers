//
//  ErrorMessages.swift
//  KurdFollowers
//
//  Created by Siros Taib on 4/21/24.
//

import Foundation

enum ErrorMessage: String {
    case invalidUsername = "The username is invalid! Please try again."
    case noInternet =  "Something went wrong! Please check your internet connection!"
    case unableToComplete = "Something went wrong! Please try again later."
    case invalidResponse = "Server error! Please try again."
    case invalidData = "Invalid data! Please try again." 
    case decodeError = "Failed to decode the recieved data!"
}
 
