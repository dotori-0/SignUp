//
//  SignUpViewController.swift
//  SignUp
//
//  Created by SC on 2022/11/02.
//

import UIKit
import RxSwift

class SignUpViewController: BaseViewController {
    // MARK: - Properties
    let signUpView = SignUpView()
    let signUpViewModel = SignUpViewModel()
    
    let disposeBag = DisposeBag()
    
    // MARK: - Life Cycle
    override func loadView() {
        view = signUpView
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        bind()
    }
    
    func bind() {
        // Input & Output
        let input = SignUpViewModel.Input(username: signUpView.usernameTextField.rx.text,
                                          email: signUpView.emailTextField.rx.text,
                                          password: signUpView.passwordTextField.rx.text)
        let output = signUpViewModel.validate(input)
        
        output.isValidUsername
            .withUnretained(self)
            .bind { (vc, isValidUsername) in
                let color: CGColor = isValidUsername ? UIColor.systemGreen.cgColor : UIColor.systemGray5.cgColor  // 👻 뭔가 입력했지만 조건에 맞지 안을 경우 빨갛게 바꾸기
                vc.signUpView.usernameTextField.layer.borderColor = color
            }
            .disposed(by: disposeBag)
        
        output.isValidEmail
            .withUnretained(self)
            .bind { (vc, isValidEmail) in
                let color: CGColor = isValidEmail ? UIColor.systemGreen.cgColor : UIColor.systemGray5.cgColor
                vc.signUpView.emailTextField.layer.borderColor = color
            }
            .disposed(by: disposeBag)
        
        output.isValidPassword
            .withUnretained(self)
            .bind { (vc, isValidPassword) in
                let color: CGColor = isValidPassword ? UIColor.systemGreen.cgColor : UIColor.systemGray5.cgColor
                vc.signUpView.passwordTextField.layer.borderColor = color
            }
            .disposed(by: disposeBag)
        
        
        
//        signUpView.usernameTextField.rx
//            .text
//            .orEmpty
//            .withUnretained(self)
//            .bind { (vc, username) in
////                vc.signUpViewModel.validateUsername(of: username)
//            }
    }
}
