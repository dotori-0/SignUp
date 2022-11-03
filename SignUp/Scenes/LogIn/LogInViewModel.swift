//
//  LogInViewModel.swift
//  SignUp
//
//  Created by SC on 2022/11/03.
//

import Foundation

import RxCocoa
import RxSwift

class LogInViewModel: Validation, CommonViewModel {
    struct Input {
        let email: ControlProperty<String?>
        let password: ControlProperty<String?>
        let logInTap: ControlEvent<Void>
    }
    
    struct Output {
        let isValidEmail: Observable<Bool>
        let isValidPassword: Observable<Bool>
        let logInTap: ControlEvent<Void>
    }
    
    func validate(_ input: Input) -> Output {
        let isValidEmail = validate(email: input.email)
        let isValidPassword = validate(password: input.password)
        
        return Output(isValidEmail: isValidEmail,
                      isValidPassword: isValidPassword,
                      logInTap: input.logInTap)
    }
    
    func logIn(email: String, password: String,
               completionHandler: @escaping completionHandler, errorHandler: @escaping errorHandler) {
        APIService.shared.logIn(email: email, password: password) {
            completionHandler()
        } errorHandler: { error in
            errorHandler(error)
        }
    }
}
