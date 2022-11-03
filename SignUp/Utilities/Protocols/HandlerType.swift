//
//  HandlerType.swift
//  SignUp
//
//  Created by SC on 2022/11/04.
//

import Foundation

protocol HandlerType {
//    typealias completionHandler = @escaping () -> Void
    // @escaping attribute may only be used in function parameter position
    typealias completionHandler = () -> Void
    typealias errorHandler = (Error?) -> Void
}
