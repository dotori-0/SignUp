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
//            .withUnretained(self)
            .subscribe(with: self, onNext: { vc, profile in
                vc.title = profile.user.username
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
            }, onError: { vc, error in
                guard error != nil else {
                    vc.alert(title: String.error, message: String.serverError)  // 여기에서도 vc 쓸 수 있는 방법
                    return
                }

                vc.alert(title: String.error, message: String.wrongEmailOrPassword)
            })
//
//            .subscribe { (vc, profile) in
////                vc.profileView.followersLabel.text = "\(profile.user.followers.count)"
////                vc.profileView.followingLabel.text = "\(profile.user.following.count)"
//                vc.title = profile.user.username
//                print("username: \(profile.user.username)")
//                vc.profileView.followersCountLabel.text = "0"
//                vc.profileView.followingCountLabel.text = "0"
//                print(profile)
//
//                // String > URL > Data > Image
//                DispatchQueue.global().async {  // 다운로드를 받는 동안 다른 작업을 할 수 있게 백그라운드 쓰레드에서 네트워크 통신 작업
//                    guard let photo = profile.user.photo else { return }
//                    guard let url = URL(string: photo) else { return }
//                    guard let data = try? Data(contentsOf: url) else { return }
//
//                    DispatchQueue.main.async {  // UI 업데이트 시 main thread에서
//                        vc.profileView.profileImageView.image = UIImage(data: data)
//                    }
//
//                }
//            } onError: { [weak self] error in
//                guard error != nil else {
//                    self?.alert(title: String.error, message: String.serverError)  // 여기에서도 vc 쓸 수 있는 방법?❔
//                    return
//                }
//
//                self?.alert(title: String.error, message: String.wrongEmailOrPassword)
//            }
            .disposed(by: disposeBag)

        profileViewModel.requestProfile { error in
            print("error", error)
        }
        
        profileView.logOutButton.rx.tap
            .withUnretained(self)
            .bind(onNext: { (vc, _) in
                vc.profileViewModel.logOut()
                vc.profileView.makeToast(String.logOutSucess, duration: 0.75, position: .center) { _ in
                    vc.setRootViewController(to: SignUpViewController(), embedNavigationContoller: true)
                }
            })
    }
}
