//
//  User.swift
//  SignUp
//
//  Created by SC on 2022/11/02.
//

import Foundation

struct User: Codable {
    let photo: String?
//    let followers: [User]  // 추가할 경우 APIService의 profile 메서드에서 .failure로 떨어지는데 statusCode는 200으로 나온다,, ❔
//    let following: [User]
    let id: String
    let email: String
    let username: String
    
    //  https://medium.com/@leandromperez/bidirectional-associations-using-value-types-in-swift-548840734047
}
