//
//  SignUpViewModel.swift
//  SignUp
//
//  Created by SC on 2022/11/02.
//

import Foundation

import RxSwift
import RxCocoa


final class SignUpViewModel: Validation, CommonViewModel {
    struct Input {
        let username: ControlProperty<String?>  // signUpView.usernameTextField.rx.text
        let email: ControlProperty<String?>     // signUpView.emailTextField.rx.text
        let password: ControlProperty<String?>  // signUpView.passwordTextField.rx.text
        let signUpTap: ControlEvent<Void>
    }
    
    struct Output {
        let isValidUsername: Observable<Bool>
        let isValidEmail: Observable<Bool>
        let isValidPassword: Observable<Bool>
        let signUpTap: ControlEvent<Void>  // 그대로 내보낼 객체들도 인풋 아웃풋에 넣는 게 나은 건지? ❔
    }
    
    func validate(_ input: Input) -> Output {
        let isValidUsername = validate(username: input.username)
        let isValidEmail = validate(email: input.email)
        let isValidPassword = validate(password: input.password)
//        let isValidAll = isValidUsername && isValidEmail && isValidPassword
        // Cannot convert value of type 'Observable<Bool>' to expected argument type 'Bool'
        
        return Output(isValidUsername: isValidUsername,
                      isValidEmail: isValidEmail,
                      isValidPassword: isValidPassword,
                      signUpTap: input.signUpTap)
    }
    
    func signUp(userName: String, email: String, password: String,
//                completionHandler: @escaping () -> Void, errorHandler: @escaping (Error?) -> Void) {
                completionHandler: @escaping completionHandler, errorHandler: @escaping errorHandler) {
        APIService.shared.signUp(userName: userName, email: email, password: password) {
            completionHandler()
        } errorHandler: { error in
            errorHandler(error)
        }
    }
}
