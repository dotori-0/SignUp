//
//  CommonViewModel.swift
//  SignUp
//
//  Created by SC on 2022/11/04.
//

import Foundation

protocol CommonViewModel {
    associatedtype Input
    associatedtype Output
    
    func validate(_ input: Input) -> Output
}
