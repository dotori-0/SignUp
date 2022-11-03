//
//  Validation.swift
//  SignUp
//
//  Created by SC on 2022/11/04.
//

import Foundation
import RxCocoa
import RxSwift

class Validation: HandlerType {
    /// Validates username
    func validate(username: ControlProperty<String?>) -> Observable<Bool> {
        let isValidUsername = username
                                .orEmpty
                                .map { !$0.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty }  // Observable<Bool>
        
        return isValidUsername
    }
    
    
    /// Validates email
    func validate(email: ControlProperty<String?>) -> Observable<Bool> {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        
        let isValidEmail = email
                            .orEmpty
                            .map { emailTest.evaluate(with: $0) }
        
        return isValidEmail
    }
    
    /// Validates password
    func validate(password: ControlProperty<String?>) -> Observable<Bool> {
        let passwordRegEx = "^[a-zA-Z0-9]{8,}$"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        
        let isValidPassword = password
                                .orEmpty
                                .map { passwordTest.evaluate(with: $0) }
        
        return isValidPassword
    }
}
