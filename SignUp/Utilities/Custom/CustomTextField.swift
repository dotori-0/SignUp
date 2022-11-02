//
//  CustomTextField.swift
//  SignUp
//
//  Created by SC on 2022/11/02.
//

import UIKit

class CustomTextField: UITextField {
    // MARK: - Initializers
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
    init(placeholder: String) {
        super.init(frame: .zero)

        self.placeholder = placeholder
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Design Methods
    private func setUI() {
        layer.borderColor = UIColor.systemGray5.cgColor
        layer.borderWidth = 2
        layer.cornerRadius = 10
    }
}
