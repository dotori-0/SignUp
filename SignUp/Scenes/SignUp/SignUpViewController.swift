//
//  SignUpViewController.swift
//  SignUp
//
//  Created by SC on 2022/11/02.
//

import UIKit

class SignUpViewController: BaseViewController {
    // MARK: - Properties
    let signUpView = SignUpView()
//    let viewModel = SearchViewModel()

    
    // MARK: - Life Cycle
    override func loadView() {
        view = signUpView
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
