//
//  LoginUseCase.swift
//  usecase_template
//
//  Created by OLUNUGA Mayowa on 19/01/2020.
//  Copyright © 2020 OLUNUGA Mayowa. All rights reserved.
//

import Foundation

class LoginUseCase {
   private var authRepository : AuthRepoProtocol
    
    init(authRepository: AuthRepoProtocol) {
        self.authRepository = authRepository
    }
    
    func invoke(username: String, password: String, completion : @escaping (_ result: Result<LoginResponseModel>)->Void){
        let requestModel = LoginRequestModel(username: username, password: password)
        authRepository.login(requestModel: requestModel, completion: { result in
            switch result{
            case .success(let data):
                _ = data.userId
                debugPrint("LoginUseCase::Class  login success data \(data)")
                //Todo: save user data to db or other business login
                completion(result)
                break;
            case .failed(_, _):
                //Todo: format message based on business rules or do something with the code base on the business rules.
                completion(result)
                break;
            }
        })
    }
}
