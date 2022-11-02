//
//  GuideLabel.swift
//  SignUp
//
//  Created by SC on 2022/11/02.
//

import UIKit

class GuideLabel: UILabel {
    // MARK: - Initializers
    init(text: String) {
        super.init(frame: .zero)

        self.text = text
        self.font = .systemFont(ofSize: 12)
        self.textColor = .systemGray2
        self.numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
