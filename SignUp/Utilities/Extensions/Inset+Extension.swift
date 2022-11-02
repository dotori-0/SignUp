//
//  Inset+Extension.swift
//  SignUp
//
//  Created by SC on 2022/11/03.
//

import UIKit

extension UITextField {
    func addInset() {
        let insetView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: self.frame.height))
        self.leftView = insetView
        self.leftViewMode = .always
    }
}
