//
//  User.swift
//  SignUp
//
//  Created by SC on 2022/11/02.
//

import Foundation

struct User: Codable {
    let photo: String?
    // 추가할 경우 APIService의 profile 메서드에서 .failure로 떨어지는데 statusCode는 200으로 나온다,,
    // followers와 following이 서버에서 어떤 타입으로 보내주는지 알고 그 타입으로 맞춰 주어야 한다
    // User 타입으로 보내주는 것이 아니기 때문에 profile 리퀘스트 시 Profile 타입으로 변경할 때 오류가 생겨서 .failure()로 떨어지는 것
//    let followers: [User]
//    let following: [User]
    let id: String
    let email: String
    let username: String
    
    //  https://medium.com/@leandromperez/bidirectional-associations-using-value-types-in-swift-548840734047
}
