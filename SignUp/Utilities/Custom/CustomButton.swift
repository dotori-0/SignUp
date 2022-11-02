//
//  CustomButton.swift
//  SignUp
//
//  Created by SC on 2022/11/03.
//

import UIKit

class CustomButton: UIButton {
    // MARK: - Properties
    private var config = UIButton.Configuration.filled()
    
    // MARK: - Initializers
    init(title: String) {
        super.init(frame: .zero)
        
        setConfiguration(with: title)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setting Methods
    private func setConfiguration(with title: String) {
        config.title = title
        config.baseBackgroundColor = .systemMint
        configuration = config
    }
    
//    func updateButtonColor(with color: UIColor) {
//        config.baseBackgroundColor = color
//        configuration = config
//    }
}
