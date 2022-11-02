//
//  BaseView.swift
//  SignUp
//
//  Created by SC on 2022/11/02.
//

import UIKit
import SnapKit
import Then

class BaseView: UIView {
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierarchy()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setting Methods
    func setUI() { }
    
    func setHierarchy() { }
    
    func setConstraints() { }
}
