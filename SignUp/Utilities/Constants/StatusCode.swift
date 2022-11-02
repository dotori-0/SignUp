//
//  StatusCode.swift
//  SignUp
//
//  Created by SC on 2022/11/02.
//

import Foundation

enum StatusCode {
    static let ok = 200
    static let badRequest = 400     // Log In: Invalid email or password
    static let unauthorized = 401   // Profile: Please login to get access
    static let notAcceptable = 406  // Sign Up: Email already taken
}
