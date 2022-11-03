//
//  LogInView.swift
//  SignUp
//
//  Created by SC on 2022/11/03.
//

import UIKit

class LogInView: BaseView {
    // MARK: - Properties
    let logInLabel = TitleLabel(text: String.logIn)
    let emailTextField = CustomTextField(placeholder: String.email).then {
        $0.keyboardType = .emailAddress
    }
    let passwordTextField = CustomTextField(placeholder: String.password).then {
        $0.isSecureTextEntry = true
    }
    
    let correctEmailGuideLabel = GuideLabel(text: String.correctEmailGuide)
    let correctPasswordGuideLabel = GuideLabel(text: String.correctPasswordGuide)
    
    let logInButton = CustomButton(title: String.logIn).then {
        $0.isEnabled = false
    }
    
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
        [logInLabel, emailTextField, correctEmailGuideLabel, passwordTextField, correctPasswordGuideLabel, logInButton].forEach {
            addSubview($0)
        }
    }
    
    override func setConstraints() {
        logInLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(30)
            make.leading.equalToSuperview().offset(30)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(logInLabel.snp.bottom).offset(40)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
        }
        
        correctEmailGuideLabel.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(6)
            make.width.equalToSuperview().multipliedBy(0.75)
            make.centerX.equalToSuperview()
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(correctEmailGuideLabel.snp.bottom).offset(24)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
        }
        
        correctPasswordGuideLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(6)
            make.width.equalToSuperview().multipliedBy(0.75)
            make.centerX.equalToSuperview()
        }
        
        logInButton.snp.makeConstraints { make in
            make.top.equalTo(correctPasswordGuideLabel.snp.bottom).offset(30)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
        }
    }
}
