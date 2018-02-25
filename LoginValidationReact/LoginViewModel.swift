//
//  LoginViewModel.swift
//  LoginValidationReact
//
//  Created by Bruno Lopes de Mello on 25/02/18.
//  Copyright © 2018 Bruno Lopes de Mello. All rights reserved.
//

import Foundation
import RxSwift

struct LoginViewModel {
    
    var emailText = Variable<String>("")
    var passwordText = Variable<String>("")
    
    var isValid: Observable<Bool> {
        return Observable.combineLatest(emailText.asObservable(), passwordText.asObservable()) { email, password in
            email.count >= 3 && password.count >= 3
        }
    }
}
