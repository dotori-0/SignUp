//
//  SignUpViewModel.swift
//  SignUp
//
//  Created by SC on 2022/11/02.
//

import Foundation
import RxSwift
import RxCocoa

class SignUpViewModel {
    struct Input {
        let username: ControlProperty<String?>  // signUpView.usernameTextField.rx.text
        let email: ControlProperty<String?>     // signUpView.emailTextField.rx.text
        let password: ControlProperty<String?>  // signUpView.passwordTextField.rx.text
    }
    
    struct Output {
        let isValidUsername: Observable<Bool>
        let isValidEmail: Observable<Bool>
        let isValidPassword: Observable<Bool>
    }
    
    func validate(_ input: Input) -> Output {
        let isValidUsername = validate(username: input.username)
        let isValidEmail = validate(email: input.email)
        let isValidPassword = validate(password: input.password)
        
        return Output(isValidUsername: isValidUsername,
                      isValidEmail: isValidEmail,
                      isValidPassword: isValidPassword)
    }
    
    /// Validates username
    private func validate(username: ControlProperty<String?>) -> Observable<Bool> {
        let isValidUsername = username
                                .orEmpty
                                .map { !$0.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty }  // Observable<Bool>
        
        return isValidUsername
    }
    
    /// Validates email
    private func validate(email: ControlProperty<String?>) -> Observable<Bool> {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        
        let isValidEmail = email
                            .orEmpty
                            .map { emailTest.evaluate(with: $0) }
        
        return isValidEmail
    }
    
    /// Validates password
    private func validate(password: ControlProperty<String?>) -> Observable<Bool> {
        let passwordRegEx = "^[a-zA-Z0-9]{8,}$"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        
        let isValidPassword = password
                                .orEmpty
                                .map { passwordTest.evaluate(with: $0) }
        
        return isValidPassword
    }
    
//    func validateUsername(of username: String, errorHandler) {
//        if username.isEmpty {  }
//    }
    
    // 유저네임
    // 빈 문자열은 501 Not Implemented
    // 스페이스만 보내면 500 Internal Server Error
    // "7   "와 같이 띄어쓰기를 뒤에 보낼 경우 유저네임은 "7"
}
