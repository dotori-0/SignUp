//
//  User.swift
//  SignUp
//
//  Created by SC on 2022/11/02.
//

import Foundation

struct User: Codable {
    let photo: String?
    let followers: [User]
    let following: [User]
    let id: String
    let email: String
    let username: String
    
    //  https://medium.com/@leandromperez/bidirectional-associations-using-value-types-in-swift-548840734047
}
