//
//  LogInViewController.swift
//  SignUp
//
//  Created by SC on 2022/11/03.
//

import UIKit
import RxSwift  // BaseViewController에서 임포트 했는데 왜 또 적어야 하는지?

class LogInViewController: BaseViewController {
    // MARK: - Properties
    let logInView = LogInView()
    let logInViewModel = LogInViewModel()
    
    let disposeBag = DisposeBag()
    
    // MARK: - Life Cycle
    override func loadView() {
        view = logInView
    }
    override func viewDidLoad() {
        super.viewDidLoad()

//        bind()
    }
    
//    func bind() {
//        // Input & Output
//        let input = SignUpViewModel.Input(username: logInView.usernameTextField.rx.text,
//                                          email: logInView.emailTextField.rx.text,
//                                          password: logInView.passwordTextField.rx.text,
//                                          signUpTap: logInView.signUpButton.rx.tap)
//        let output = signUpViewModel.validate(input)
//
//        output.isValidUsername
//            .withUnretained(self)
//            .bind { (vc, isValidUsername) in
//                let color: CGColor = isValidUsername ? UIColor.systemGreen.cgColor : UIColor.systemGray5.cgColor  // 👻 뭔가 입력했지만 조건에 맞지 안을 경우 빨갛게 바꾸기
//                vc.logInView.usernameTextField.layer.borderColor = color
//            }
//            .disposed(by: disposeBag)
//
//        output.isValidEmail
//            .withUnretained(self)
//            .bind { (vc, isValidEmail) in
//                let color: CGColor = isValidEmail ? UIColor.systemGreen.cgColor : UIColor.systemGray5.cgColor
//                vc.logInView.emailTextField.layer.borderColor = color
//            }
//            .disposed(by: disposeBag)
//
//        output.isValidPassword
//            .withUnretained(self)
//            .bind { (vc, isValidPassword) in
//                let color: CGColor = isValidPassword ? UIColor.systemGreen.cgColor : UIColor.systemGray5.cgColor
//                vc.logInView.passwordTextField.layer.borderColor = color
//            }
//            .disposed(by: disposeBag)
//
//        // 이렇게 하는 형태가 맞는지? ❔
//        Observable.combineLatest(output.isValidUsername, output.isValidEmail, output.isValidPassword)
////            .withUnretained(self)
////            .bind(onNext: { (SignUpViewController, (Bool, Bool, Bool)) in
////                <#code#>
////            })
//            .bind { [weak self] (isValidUsername, isValidEmail, isValidPassword) in
//                self?.logInView.signUpButton.isEnabled = isValidUsername && isValidEmail && isValidPassword
//            }
//            .disposed(by: disposeBag)
//
//
//        output.signUpTap
//            .withUnretained(self)
//            .bind { (vc, _) in
//                guard let username = vc.logInView.usernameTextField.text,
//                      let email = vc.logInView.emailTextField.text,
//                      let password = vc.logInView.passwordTextField.text else {
//                    vc.alert(title: String.error, message: String.inputReadingError)
//                    return
//                }
//
//                vc.signUpViewModel.signUp(userName: username, email: email, password: password) {
//                    vc.alert(title: String.success, message: String.signUpSucess)
//                    print(username, email, password)
//                } errorHandler: { error in
//                    guard let error = error else {
//                        vc.alert(title: String.error, message: String.serverError)
//                        return
//                    }
//
//                    vc.alert(title: String.error, message: String.emailAlreadyTaken)
//                }
//            }
//            .disposed(by: disposeBag)
//
//
//
////        signUpView.usernameTextField.rx
////            .text
////            .orEmpty
////            .withUnretained(self)
////            .bind { (vc, username) in
//////                vc.signUpViewModel.validateUsername(of: username)
////            }
//    }
}
