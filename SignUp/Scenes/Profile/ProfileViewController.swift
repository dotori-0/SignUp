//
//  ProfileViewController.swift
//  SignUp
//
//  Created by SC on 2022/11/04.
//

import UIKit
import RxSwift

class ProfileViewController: BaseViewController {
    // MARK: - Properties
    let profileView = ProfileView()
    let profileViewModel = ProfileViewModel()
    
    let disposeBag = DisposeBag()
    
    // MARK: - Life Cycle
    override func loadView() {
        view = profileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "title"  // 왜 여기서 이렇게 한 번 해야 리스펀스도 타이틀에 보이는지?❔
        bind()
    }
    
    // MARK: - Private Methods
    func bind() {
        
        profileViewModel.profile
            .withUnretained(self)
            .subscribe { (vc, profile) in
//                vc.profileView.followersLabel.text = "\(profile.user.followers.count)"
//                vc.profileView.followingLabel.text = "\(profile.user.following.count)"
                vc.title = profile.user.username
//                vc.navigationItem.title = profile.user.username
//                vc.navigationController?.title = profile.user.username
                print("username: \(profile.user.username)")
                vc.profileView.followersCountLabel.text = "0"
                vc.profileView.followingCountLabel.text = "0"
                print(profile)
                
                // String > URL > Data > Image
                DispatchQueue.global().async {  // 다운로드를 받는 동안 다른 작업을 할 수 있게 백그라운드 쓰레드에서 네트워크 통신 작업
                    guard let photo = profile.user.photo else { return }
                    guard let url = URL(string: photo) else { return }
                    guard let data = try? Data(contentsOf: url) else { return }
                    
                    DispatchQueue.main.async {  // UI 업데이트 시 main thread에서
                        vc.profileView.profileImageView.image = UIImage(data: data)
                    }
                    
                }
            } onError: { [weak self] error in
                guard error != nil else {  // 예상치 못한(?) 상태코드가 있어서 에러가 nil인 상황이 생긴다면? ❔
                    self?.alert(title: String.error, message: String.serverError)  // 여기에서도 vc 쓸 수 있는 방법?❔
                    return
                }

                self?.alert(title: String.error, message: String.wrongEmailOrPassword)
            }
            .disposed(by: disposeBag)

        profileViewModel.requestProfile {
             
        } errorHandler: { error in
            print("error", error)
        }

        
        // Input & Output
//        let input = LogInViewModel.Input(email: profileView.emailTextField.rx.text,
//                                         password: profileView.passwordTextField.rx.text,
//                                         logInTap: profileView.logInButton.rx.tap)
//
//        let output = profileViewModel.validate(input)
//
//        output.isValidEmail
//            .withUnretained(self)
//            .bind { (vc, isValidEmail) in
//                let color: CGColor = isValidEmail ? .valid : .invalid
//                vc.profileView.emailTextField.layer.borderColor = color
//            }
//            .disposed(by: disposeBag)
//
//        output.isValidPassword
//            .withUnretained(self)
//            .bind { (vc, isValidPassword) in
//                let color: CGColor = isValidPassword ? .valid : .invalid
//                vc.profileView.passwordTextField.layer.borderColor = color
//            }
//            .disposed(by: disposeBag)
//
//        // 이렇게 하는 형태가 맞는지? ❔
//        Observable.combineLatest(output.isValidEmail, output.isValidPassword)
//            .bind { [weak self] (isValidEmail, isValidPassword) in
//                self?.profileView.logInButton.isEnabled = isValidEmail && isValidPassword
//            }
//            .disposed(by: disposeBag)
//
//        output.logInTap
//            .withUnretained(self)
//            .bind { (vc, _) in
//                guard let email = vc.profileView.emailTextField.text,
//                      let password = vc.profileView.passwordTextField.text else {
//                    vc.alert(title: String.error, message: String.inputReadingError)
//                    return
//                }
//
//                vc.profileViewModel.logIn(email: email, password: password) {
//                    vc.profileView.makeToast(String.logInSuccess, duration: 0.5, position: .center) { _ in
//                        vc.navigationController?.pushViewController(LogInViewController(), animated: true)
//                    }
//                    print(email, password)
//                } errorHandler: { error in
//                    guard error != nil else {
//                        vc.alert(title: String.error, message: String.serverError)
//                        return
//                    }
//
//                    vc.alert(title: String.error, message: String.wrongEmailOrPassword)
//                }
//            }
//            .disposed(by: disposeBag)
    }
}
