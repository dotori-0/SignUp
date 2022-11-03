//
//  Endpoint.swift
//  SignUp
//
//  Created by SC on 2022/11/02.
//

import Foundation
import Alamofire

enum SeSACAPI {
    case signup(userName: String, email: String, password: String)
    case login(email: String, password: String)
    case profile
}

extension SeSACAPI {
    var url: String {  // URL이 아니라 String으로 해도 되지만 URL로 하는 것이 더 맞는지?
        switch self {
            case .signup:
                return "http://api.memolease.com/api/v1/users/signup"
            case .login:
                return "http://api.memolease.com/api/v1/users/login"
            case .profile:
                return "http://api.memolease.com/api/v1/users/me"
        }
    }
    
    var headers: HTTPHeaders {
        switch self {
            case .signup, .login:
                return ["Content-Type": "application/x-www-form-urlencoded"]
            case .profile:
                return ["Authorization": "Bearer \(UserDefaults.token)"]
        }
    }
    
    var parameters: Parameters {
        switch self {
            case .signup(let userName, let email, password: let password):
                return [
                    "userName": userName,
                    "email": email,
                    "password": password
                ]
            case .login(let email, let password):
                return [
                    "email": email,
                    "password": password
                ]
            case .profile:
                return ["": ""]
        }
    }
}
