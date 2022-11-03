//
//  ProfileView.swift
//  SignUp
//
//  Created by SC on 2022/11/04.
//

import UIKit

class ProfileView: BaseView {
    // MARK: - Properties
    let profileLabel = TitleLabel(text: String.profile)
    let profileImageView = UIImageView()
    let followersLabel = FollowingLabel(text: String.followers)
    let followingLabel = FollowingLabel(text: String.following)
    let followersCountLabel = FollowingLabel(isCount: true)
    let followingCountLabel = FollowingLabel(isCount: true)
    let logOutButton = CustomButton(title: String.logOut)
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setting Methods
    override func setUI() {

    }
    
    override func setHierarchy() {  // addSubView, CollectionView init, SnapKit 구성 등
        [profileLabel, profileImageView, followersLabel, followingLabel, followersCountLabel, followingCountLabel, logOutButton].forEach {
            addSubview($0)
        }
    }
    
    override func setConstraints() {
        profileLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(30)
            make.leading.equalToSuperview().offset(30)
        }
        
        profileImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(40)
            make.top.equalTo(profileLabel.snp.bottom).offset(40)
            make.width.equalToSuperview().multipliedBy(0.2)
            make.height.equalTo(profileImageView.snp.width)
        }
        
        followersLabel.snp.makeConstraints { make in
            make.leading.equalTo(profileImageView.snp.trailing).offset(50)
            make.top.equalTo(profileImageView.snp.centerY).offset(1)
        }
        
        followingLabel.snp.makeConstraints { make in
            make.leading.equalTo(followersLabel.snp.trailing).offset(40)
            make.centerY.equalTo(followersLabel)
        }
        
        followersCountLabel.snp.makeConstraints { make in
            make.centerX.equalTo(followersLabel)
            make.bottom.equalTo(profileImageView.snp.centerY).offset(-1)
        }
        
        followingCountLabel.snp.makeConstraints { make in
            make.centerX.equalTo(followingLabel)
            make.bottom.equalTo(profileImageView.snp.centerY).offset(-2)
        }
        
        logOutButton.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide).offset(-20)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
        }
    }
}
