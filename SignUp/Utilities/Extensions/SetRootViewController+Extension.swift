//
//  SetRootViewController+Extension.swift
//  SignUp
//
//  Created by SC on 2022/11/06.
//

import UIKit

extension UIViewController {
    func setRootViewController<T: UIViewController>(to: T, embedNavigationContoller: Bool = false) {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let sceneDelegate = windowScene?.delegate as? SceneDelegate
        
        let rootVC = embedNavigationContoller ? UINavigationController(rootViewController: T()) : T()
        
        sceneDelegate?.window?.rootViewController = rootVC
        sceneDelegate?.window?.makeKeyAndVisible()
    }
}
