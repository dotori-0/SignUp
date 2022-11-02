//
//  TitleLabel.swift
//  SignUp
//
//  Created by SC on 2022/11/02.
//

import UIKit

class TitleLabel: UILabel {
    // MARK: - Initializers
    init(text: String) {
        super.init(frame: .zero)

        self.text = text
        self.font = .boldSystemFont(ofSize: 40)
        self.textColor = .label  // 없어도 됨? 👻
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
