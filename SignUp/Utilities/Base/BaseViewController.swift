//
//  BaseViewController.swift
//  SignUp
//
//  Created by SC on 2022/11/02.
//

import UIKit

class BaseViewController: UIViewController {
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        setHierarchy()
        setConstraints()
    }
    
    // MARK: - Setting Methods
    func setUI() {
        view.backgroundColor = .systemBackground
    }
    
    func setHierarchy() { }
    
    func setConstraints() { }
}
