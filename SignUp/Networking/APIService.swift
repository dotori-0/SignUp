//
//  APIService.swift
//  SignUp
//
//  Created by SC on 2022/11/02.
//

import Foundation
import Alamofire  // 👻 URLSession으로 해 보기

final class APIService: HandlerType {
    static let shared = APIService()
    
    private init() { }
    
    func signUp(userName: String, email: String, password: String,
                completionHandler: @escaping completionHandler, errorHandler: @escaping errorHandler) {
        let api = SeSACAPI.signup(userName: userName, email: email, password: password)
        
        AF.request(api.url, method: .post, parameters: api.parameters, headers: api.headers)
            .responseString { response in
                print("🐣 회원가입 성공")
                print(response)
                print(response.response?.statusCode)  // 406 Not Acceptable  // 200 OK
                
                guard let statusCode = response.response?.statusCode else {
                    errorHandler(nil)
                    return
                }
                
                switch statusCode {
                    case AccountError.ok.rawValue: completionHandler()
                    default: errorHandler(AccountError(rawValue: statusCode))  // 가능 코드: notAcceptable 406
                }
            }
    }
    
    func logIn(email: String, password: String,
               completionHandler: @escaping completionHandler, errorHandler: @escaping errorHandler) {
        let api = SeSACAPI.login(email: email, password: password)
        
        AF.request(api.url, method: .post, parameters: api.parameters)
            .validate(statusCode: 200...299)
            .responseDecodable(of: Login.self) { response in
                switch response.result {
                    case .success(let login):
                        print("🐣 로그인 성공")
                        print(login.token)
                        print("UD token: \(UserDefaults.token)")
                        
                        UserDefaults.token = login.token  // 로그인할 때마다 토큰이 달라지므로 새로 갈아 끼우기
                        print("UD token: \(UserDefaults.token)")
                        completionHandler()
                    case .failure(_):
                        print("🐣 로그인 실패")
                        print(response.response?.statusCode)
                        
                        guard let statusCode = response.response?.statusCode else {
                            errorHandler(nil)
                            return
                        }

//                        case StatusCode.ok: completionHandler()  // case .success(let login): 에 해당하므로 생략
                        errorHandler(AccountError(rawValue: statusCode))  // 가능 코드: badRequest 406
                }
            }
    }
    
    func profile(completionHandler: @escaping (Profile?) -> Void,
                 errorHandler: @escaping errorHandler) {
        let api = SeSACAPI.profile
        
        AF.request(api.url, method: .get, headers: api.headers)
            .responseDecodable(of: Profile.self) { response in
                switch response.result {
                    case .success(let profile):
                        print("🐣 프로필 조회 성공")
                        print(profile)
                        completionHandler(profile)
                    case .failure(_):
                        print("🐣 프로필 조회 실패")
                        print(response.response?.statusCode)
                        
                        guard let statusCode = response.response?.statusCode else {
                            errorHandler(nil)
                            return
                        }
                        
//                        case StatusCode.ok: completionHandler()  // case .success(let login): 에 해당하므로 생략
                        errorHandler(AccountError(rawValue: statusCode))  // 가능 코드: unauthorized 401
                }
            }
    }
}

