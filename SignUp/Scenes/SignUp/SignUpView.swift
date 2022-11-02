//
//  SignUpView.swift
//  SignUp
//
//  Created by SC on 2022/11/02.
//

import UIKit

class SignUpView: BaseView {
    // MARK: - Properties
    let signUpLabel = CustomLabel(text: String.signUp)
    let usernameTextField = CustomTextField(placeholder: String.username)
    let emailTextField = CustomTextField(placeholder: String.email)
    let passwordTextField = CustomTextField(placeholder: String.password)
    
//    let usernameTextField = CustomTextField().then {
//        $0.placeholder = String.username
//    }
//
//    let emailTextField = CustomTextField().then {
//        $0.placeholder = String.email
//    }
//
//    let passwordTextField = CustomTextField().then {
//        $0.placeholder = String.password
//    }

    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setting Methods
    override func setUI() {

    }
    
    override func setHierarchy() {  // addSubView, CollectionView init, SnapKit 구성 등
        [signUpLabel, usernameTextField, emailTextField, passwordTextField].forEach {
            addSubview($0)
        }
    }
    
    override func setConstraints() {
        signUpLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(30)
            make.leading.equalToSuperview().offset(30)
        }
        
        usernameTextField.snp.makeConstraints { make in
            make.top.equalTo(signUpLabel.snp.bottom).offset(60)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(usernameTextField.snp.bottom).offset(30)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(30)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
        }
    }
}
