//
//  SignUpView.swift
//  SignUp
//
//  Created by SC on 2022/11/02.
//

import UIKit

class SignUpView: BaseView {
    // MARK: - Properties
    let signUpLabel = TitleLabel(text: String.signUp)
    let usernameTextField = CustomTextField(placeholder: String.username)
    let emailTextField = CustomTextField(placeholder: String.email).then {
        $0.keyboardType = .emailAddress
    }
    let passwordTextField = CustomTextField(placeholder: String.password).then {
        $0.isSecureTextEntry = true
    }
    
    let usernameGuideLabel = GuideLabel(text: String.usernameGuide)
    let emailGuideLabel = GuideLabel(text: String.emailGuide)
    let passwordGuideLabel = GuideLabel(text: String.passwordGuide)
    
    let signUpButton = CustomButton(title: String.signUp).then {
        $0.isEnabled = false
    }
    
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
        [signUpLabel, usernameTextField, usernameGuideLabel, emailTextField, emailGuideLabel, passwordTextField, passwordGuideLabel, signUpButton].forEach {
            addSubview($0)
        }
    }
    
    override func setConstraints() {
        signUpLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(30)
            make.leading.equalToSuperview().offset(30)
        }
        
        usernameTextField.snp.makeConstraints { make in
            make.top.equalTo(signUpLabel.snp.bottom).offset(40)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
        }
        
        usernameGuideLabel.snp.makeConstraints { make in
            make.top.equalTo(usernameTextField.snp.bottom).offset(6)
            make.width.equalToSuperview().multipliedBy(0.75)
            make.centerX.equalToSuperview()
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(usernameGuideLabel.snp.bottom).offset(24)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
        }
        
        emailGuideLabel.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(6)
            make.width.equalToSuperview().multipliedBy(0.75)
            make.centerX.equalToSuperview()
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailGuideLabel.snp.bottom).offset(24)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
        }
        
        passwordGuideLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(6)
            make.width.equalToSuperview().multipliedBy(0.75)
            make.centerX.equalToSuperview()
        }
        
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(passwordGuideLabel.snp.bottom).offset(30)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
        }
    }
}
