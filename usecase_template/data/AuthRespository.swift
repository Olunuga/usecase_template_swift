//
//  AuthRespository.swift
//  usecase_template
//
//  Created by OLUNUGA Mayowa on 19/01/2020.
//  Copyright © 2020 OLUNUGA Mayowa. All rights reserved.
//

import Foundation


class AuthRespository: AuthRepoProtocol{
    var remoteDataSource : AuthDataSourceProtocol
    init(remoteDataSource : AuthDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
    }
    
    func login(requestModel: LoginRequestModel, completion:@escaping (Result<LoginResponseModel>) -> Void) {
         remoteDataSource.login(requestModel: requestModel, completion:completion)
    }
    
    func signUp(requestModel: SignUpRequestModel, completion: (Result<Any>) -> Void) {
        remoteDataSource.signUp(requestModel: requestModel, completion: completion)
    }
    
}
