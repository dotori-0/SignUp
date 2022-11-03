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
    
    // MARK: - Private Methods
    private func bind() {
        // Input & Output
        let input = SignUpViewModel.Input(username: signUpView.usernameTextField.rx.text,
                                          email: signUpView.emailTextField.rx.text,
                                          password: signUpView.passwordTextField.rx.text,
                                          signUpTap: signUpView.signUpButton.rx.tap)
        let output = signUpViewModel.validate(input)
        
        output.isValidUsername
            .withUnretained(self)
            .bind { (vc, isValidUsername) in
                let color: CGColor = isValidUsername ? .valid : .invalid  // 👻 뭔가 입력했지만 조건에 맞지 안을 경우 빨갛게 바꾸기
                vc.signUpView.usernameTextField.layer.borderColor = color
            }
            .disposed(by: disposeBag)
        
        output.isValidEmail
            .withUnretained(self)
            .bind { (vc, isValidEmail) in
                let color: CGColor = isValidEmail ? .valid : .invalid
                vc.signUpView.emailTextField.layer.borderColor = color
            }
            .disposed(by: disposeBag)
        
        output.isValidPassword
            .withUnretained(self)
            .bind { (vc, isValidPassword) in
                let color: CGColor = isValidPassword ? .valid : .invalid
                vc.signUpView.passwordTextField.layer.borderColor = color
            }
            .disposed(by: disposeBag)
        
        // 이렇게 하는 형태가 맞는지? ❔
        Observable.combineLatest(output.isValidUsername, output.isValidEmail, output.isValidPassword)
//            .withUnretained(self)
//            .bind(onNext: { (SignUpViewController, (Bool, Bool, Bool)) in
//                <#code#>
//            })
            .bind { [weak self] (isValidUsername, isValidEmail, isValidPassword) in
                self?.signUpView.signUpButton.isEnabled = isValidUsername && isValidEmail && isValidPassword
            }
            .disposed(by: disposeBag)
        
        
        output.signUpTap
            .withUnretained(self)
            .bind { (vc, _) in
                guard let username = vc.signUpView.usernameTextField.text,
                      let email = vc.signUpView.emailTextField.text,
                      let password = vc.signUpView.passwordTextField.text else {
                    vc.alert(title: String.error, message: String.inputReadingError)
                    return
                }
                
                vc.signUpViewModel.signUp(userName: username, email: email, password: password) {
//                    vc.alert(title: String.success, message: String.signUpSucess)
                    vc.signUpView.makeToast(String.signUpSuccess, duration: 0.5, position: .center) { _ in
                        vc.navigationController?.pushViewController(LogInViewController(), animated: true)
                    }
                    print(username, email, password)
                } errorHandler: { error in
                    guard error != nil else {
                        vc.alert(title: String.error, message: String.serverError)
                        return
                    }
                    
                    vc.alert(title: String.error, message: String.emailAlreadyTaken)
                }
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
    
    // MARK: - Setting Methods
    override func setUI() {
        super.setUI()
        
//        title = String.signUp
//        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
