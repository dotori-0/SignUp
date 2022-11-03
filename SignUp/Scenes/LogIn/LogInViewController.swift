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

        bind()
    }
    
    // MARK: - Private Methods
    func bind() {
        // Input & Output
        let input = LogInViewModel.Input(email: logInView.emailTextField.rx.text,
                                         password: logInView.passwordTextField.rx.text,
                                         logInTap: logInView.logInButton.rx.tap)
        
        let output = logInViewModel.validate(input)

        output.isValidEmail
            .withUnretained(self)
            .bind { (vc, isValidEmail) in
                let color: CGColor = isValidEmail ? .valid : .invalid
                vc.logInView.emailTextField.layer.borderColor = color
            }
            .disposed(by: disposeBag)

        output.isValidPassword
            .withUnretained(self)
            .bind { (vc, isValidPassword) in
                let color: CGColor = isValidPassword ? .valid : .invalid
                vc.logInView.passwordTextField.layer.borderColor = color
            }
            .disposed(by: disposeBag)

        // 이렇게 하는 형태가 맞는지? ❔
        Observable.combineLatest(output.isValidEmail, output.isValidPassword)
            .bind { [weak self] (isValidEmail, isValidPassword) in
                self?.logInView.logInButton.isEnabled = isValidEmail && isValidPassword
            }
            .disposed(by: disposeBag)
        
        output.logInTap
            .withUnretained(self)
            .bind { (vc, _) in
                guard let email = vc.logInView.emailTextField.text,
                      let password = vc.logInView.passwordTextField.text else {
                    vc.alert(title: String.error, message: String.inputReadingError)
                    return
                }
                
                vc.logInViewModel.logIn(email: email, password: password) {
                    vc.logInView.makeToast(String.logInSuccess, duration: 0.5, position: .center) { _ in
                        vc.navigationController?.pushViewController(ProfileViewController(), animated: true)
                    }
                    print(email, password)
                } errorHandler: { error in
                    guard error != nil else {
                        vc.alert(title: String.error, message: String.serverError)
                        return
                    }

                    vc.alert(title: String.error, message: String.wrongEmailOrPassword)
                }
            }
            .disposed(by: disposeBag)
    }
}
