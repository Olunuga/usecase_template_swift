//
//  LoginViewModel.swift
//  usecase_template
//
//  Created by OLUNUGA Mayowa on 19/01/2020.
//  Copyright © 2020 OLUNUGA Mayowa. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol LoginViewModelOutputs {
    var loginResult: BehaviorSubject<ViewModelResult<Bool>> { get }
}

class LoginViewModel : LoginViewModelOutputs{
    var loginResult: BehaviorSubject<ViewModelResult<Bool>>
    
    var loginUseCase : LoginUseCase
    var callResult : ViewModelResult<Bool>?

    init(loginUseCase : LoginUseCase) {
        self.loginUseCase = loginUseCase
        callResult = ViewModelResult.loading(false)
        
        loginResult = BehaviorSubject.init(value: callResult!)
    }
    
    func login(){
        //validate input fields
        
        //Inform the user that data is loading
        callResult = ViewModelResult.loading(true)
        loginResult.onNext(callResult!)
        
        //perfom user useCase
        loginUseCase.invoke(username: "JohnAPllesed", password: "SeeMeAndISeeYou", completion : {
            result in
            switch result{
            case .success(_):
                debugPrint("LoginiewModel::Class  Login success")
                //inform the user that data has finished loading with success
                self.callResult = ViewModelResult.success(true)
                self.loginResult.onNext(self.callResult!)
                break;
            case .failed(let message, _):
                debugPrint("LoginiewModel::Class  Login failed")
                //inform the user that data has finished loading with error and show message
                self.callResult = ViewModelResult.failed(message)
                self.loginResult.onNext(self.callResult!)
            break
            }
        })
    }
}

enum ViewModelResult<T> {
    case success(T)
    case failed(String)
    case loading(Bool)
}


