//
//  SignUpViewModel.swift
//  SignUp
//
//  Created by SC on 2022/11/02.
//

import Foundation

// Validation Class를 상속하는데 왜 여기서도 import를 해야 하는지? ❔
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
        let signUpTap: ControlEvent<Void>  // 그대로 내보낼 객체들도 인풋 아웃풋에 넣는 게 나은 건지?
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
    
//    /// Validates username
//    private func validate(username: ControlProperty<String?>) -> Observable<Bool> {
//        let isValidUsername = username
//                                .orEmpty
//                                .map { !$0.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty }  // Observable<Bool>
//
//        return isValidUsername
//    }
//
//    /// Validates email
//    private func validate(email: ControlProperty<String?>) -> Observable<Bool> {
//        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
//        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
//
//        let isValidEmail = email
//                            .orEmpty
//                            .map { emailTest.evaluate(with: $0) }
//
//        return isValidEmail
//    }
//
//    /// Validates password
//    private func validate(password: ControlProperty<String?>) -> Observable<Bool> {
//        let passwordRegEx = "^[a-zA-Z0-9]{8,}$"
//        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
//
//        let isValidPassword = password
//                                .orEmpty
//                                .map { passwordTest.evaluate(with: $0) }
//
//        return isValidPassword
//    }
    
    func signUp(userName: String, email: String, password: String,
//                completionHandler: @escaping () -> Void, errorHandler: @escaping (Error?) -> Void) {
                completionHandler: @escaping completionHandler, errorHandler: @escaping errorHandler) {
        APIService.shared.signUp(userName: userName, email: email, password: password) {
            completionHandler()
        } errorHandler: { error in
            errorHandler(error)
        }
    }
    
    // 유저네임
    // 빈 문자열은 501 Not Implemented
    // 스페이스만 보내면 500 Internal Server Error
    // "7   "와 같이 띄어쓰기를 뒤에 보낼 경우 유저네임은 "7"
}
