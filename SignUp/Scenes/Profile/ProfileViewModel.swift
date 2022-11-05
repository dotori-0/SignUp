//
//  ProfileViewModel.swift
//  SignUp
//
//  Created by SC on 2022/11/04.
//

import Foundation
import RxSwift

class ProfileViewModel: HandlerType {
    let profile = PublishSubject<Profile>()
    
    func requestProfile(errorHandler: @escaping errorHandler) {
        APIService.shared.profile { [weak self] profile in
            guard let profile else {
                self?.profile.onError(AccountError.serverError)
                return
            }
            
            self?.profile.onNext(profile)
        } errorHandler: { error in
            guard let error else {
                errorHandler(error)
                return
            }
            self.profile.onError(error)
        }
    }
}
