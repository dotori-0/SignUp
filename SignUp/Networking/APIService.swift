//
//  APIService.swift
//  SignUp
//
//  Created by SC on 2022/11/02.
//

import Foundation
import Alamofire

class APIService {
    static let shared = APIService()
    
    private init() { }
    
    func signUp(userName: String, email: String, password: String,  // 👻 typealias
                completionHandler: @escaping () -> Void, errorHandler: @escaping (Error?) -> Void) {
        let api = SeSACAPI.signup(userName: userName, email: email, password: password)
        
        AF.request(api.url, method: .post, parameters: api.parameters, headers: api.headers)
            .responseString { response in
                print("🐣 회원가입 성공")
                print(response)
                print(response.response?.statusCode)  // 406 Not Acceptable  // 200 OK
                
                guard let statusCode = response.response?.statusCode else {
                    errorHandler(nil)  // 이런 걸 서버 통시 오류로 퉁쳐도 될지?❔
                    return
                }
                
                switch statusCode {
//                    case AccountError.notAcceptable.rawValue: // 이렇게?
                    case StatusCode.notAcceptable: errorHandler(AccountError.notAcceptable)  // 아님 이렇게?
                    case StatusCode.ok: completionHandler()
                    default: errorHandler(nil)  // 이런 걸 서버 통시 오류로 퉁쳐도 될지?❔
                }
            }
    }
    
    func logIn(email: String, password: String,
               completionHandler: @escaping () -> Void, errorHandler: @escaping (Error?) -> Void) {
        let api = SeSACAPI.login(email: email, password: password)
        
        AF.request(api.url, method: .post, parameters: api.parameters)
            .validate(statusCode: 200...299)
            .responseDecodable(of: Login.self) { response in
                switch response.result {
                    case .success(let login):
                        print("🐣 로그인 성공")
                        print(login.token)
                        UserDefaults.standard.set(login.token, forKey: "token")
                        completionHandler()
                    case .failure(_):
                        print("🐣 로그인 실패")
                        print(response.response?.statusCode)
                        
                        guard let statusCode = response.response?.statusCode else {
                            errorHandler(nil)
                            return
                        }
                        
                        switch statusCode {
//                            case AccountError.badRequest.rawValue: // 이렇게?
                            case StatusCode.badRequest: errorHandler(AccountError.badRequest)  // 아님 이렇게?
//                            case StatusCode.ok: completionHandler()  // case .success(let login): 에 해당하므로 생략
                            default: errorHandler(nil)
                        }
                }
            }
    }
    
    func profile(completionHandler: @escaping () -> Void, errorHandler: @escaping (Error?) -> Void) {
        let api = SeSACAPI.profile
        
        AF.request(api.url, method: .get, headers: api.headers)
            .responseDecodable(of: Profile.self) { response in
                switch response.result {
                    case .success(let profile):
                        print("🐣 프로필 조회 성공")
                        print(profile)
                        completionHandler()
                    case .failure(_):
                        print("🐣 프로필 조회 실패")
                        print(response.response?.statusCode)
                        
                        guard let statusCode = response.response?.statusCode else {
                            errorHandler(nil)
                            return
                        }
                        
                        switch statusCode {
//                            case AccountError.unauthorized.rawValue: // 이렇게?
                            case StatusCode.unauthorized: errorHandler(AccountError.unauthorized)  // 아님 이렇게?
//                            case StatusCode.ok: completionHandler()  // case .success(let profile): 에 해당하므로 생략
                            default: errorHandler(nil)
                        }
                }
            }
    }
}


enum AccountError: Int, Error {
    case badRequest = 400     // Log In: Invalid email or password
    case unauthorized = 401   // Profile: Please login to get access
    case notAcceptable = 406  // Sign Up: Email already taken
}
