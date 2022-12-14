//
//  UserDefault.swift
//  SignUp
//
//  Created by SC on 2022/11/04.
//

import Foundation

protocol UserDefaultsKey {
    
}

@propertyWrapper
struct UserDefault<T>: UserDefaultsKey {
    let key: String
    let defaultValue: T
    let container: UserDefaults = .standard
    
    var wrappedValue: T {
        get {
            return container.object(forKey: key) as? T ?? defaultValue
        }
        set {
            container.set(newValue, forKey: key)
        }
    }
}
