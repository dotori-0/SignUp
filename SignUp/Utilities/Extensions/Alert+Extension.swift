//
//  Alert+Extension.swift
//  SignUp
//
//  Created by SC on 2022/11/02.
//

import UIKit

extension UIViewController {
    func alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .cancel)
        
        alert.addAction(ok)
        present(alert, animated: true)
    }
}
