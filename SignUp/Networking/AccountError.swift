//
//  AccountError.swift
//  SignUp
//
//  Created by SC on 2022/11/03.
//

import Foundation

enum AccountError: Int, Error {
    case ok = 200             // 이것 때문에라도 StatusCode 타입을 하나 더 만드는 것이 더 적절한 방법인지?❔
    case serverError = 500
    case badRequest = 400     // Log In: Invalid email or password
    case unauthorized = 401   // Profile: Please login to get access
    case notAcceptable = 406  // Sign Up: Email already taken
    
    
    // 유저네임
    // 빈 문자열은 501 Not Implemented
    // 스페이스만 보내면 500 Internal Server Error
    // "7   "와 같이 띄어쓰기를 뒤에 보낼 경우 유저네임은 "7"
}
