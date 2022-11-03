//
//  String+Extension.swift
//  SignUp
//
//  Created by SC on 2022/11/02.
//

import Foundation

extension String {
    // Sign Up & Log In
    static let signUp = "Sign Up"
    static let logIn = "Log In"
    static let username = "유저네임을 입력해 주세요"
    static let usernameGuide = "빈 문자열 혹은 스페이스로만 이루어질 수 없으며\n앞과 뒤의 스페이스는 생략됩니다."
    static let email = "이메일을 입력해 주세요"
    static let emailGuide = "알맞은 이메일 형태로 입력해 주세요."
    static let correctEmailGuide = "알맞은 이메일을 입력해 주세요."
    static let password = "비밀번호를 입력해 주세요"
    static let correctPasswordGuide = "알맞은 비밀번호를 입력해 주세요."
    static let passwordGuide = "비밀번호는 8자 이상이어야 합니다."
    
    // Error
    static let error = "오류"
    static let inputReadingError = "입력값 읽기에 오류가 발생했습니다."
    static let serverError = "서버 통신에 오류가 있습니다."
    static let emailAlreadyTaken = "이미 가입된 이메일입니다."
    static let wrongEmailOrPassword = "이메일 혹은 비밀번호가 틀렸습니다."
    
    // Success
    static let success = "성공"
    static let signUpSuccess = "회원가입에 성공했습니다.\n로그인해 주세요."
    static let logInSuccess = "성공적으로 로그인되었습니다."
    
    // Profile
    static let profile = "Profile"
    static let followers = "Followers"
    static let following = "Following"
    static let logOut = "Log Out"
}
