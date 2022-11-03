//
//  AccountError.swift
//  SignUp
//
//  Created by SC on 2022/11/03.
//

import Foundation

enum AccountError: Int, Error {
    case serverError
    case badRequest = 400     // Log In: Invalid email or password
    case unauthorized = 401   // Profile: Please login to get access
    case notAcceptable = 406  // Sign Up: Email already taken
}
