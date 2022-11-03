//
//  UserDefaults+Extension.swift
//  SignUp
//
//  Created by SC on 2022/11/04.
//

import Foundation

extension UserDefaults {
    @UserDefault(key: Key.token, defaultValue: "")
    static var token: String
}
