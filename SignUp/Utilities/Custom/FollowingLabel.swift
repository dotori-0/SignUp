//
//  FollowingLabel.swift
//  SignUp
//
//  Created by SC on 2022/11/04.
//

import UIKit

class FollowingLabel: UILabel {
    // MARK: - Initializers
    init(text: String? = nil, isCount: Bool = false) {
        super.init(frame: .zero)

        self.text = text
        self.font = isCount ? .boldSystemFont(ofSize: 17) : .systemFont(ofSize: 12.5)
        self.textColor = .label
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
