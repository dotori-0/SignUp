//
//  UserDefaultsKey+Extension.swift
//  SignUp
//
//  Created by SC on 2022/11/04.
//

import Foundation

extension UserDefaults {
    enum Key {
        static let token = "token"
    }
    
    static func delete(_ key: String) {
        UserDefaults.standard.removeObject(forKey: key)
    }
    
    static func remove(_ key: UserDefault<String>) {
//    static func remove(_ key: UserDefaultsKey) {
        UserDefaults.standard.removeObject(forKey: key.key)
    }
}
