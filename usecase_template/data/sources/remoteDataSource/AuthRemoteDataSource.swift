//
//  AuthRemoteDataSource.swift
//  usecase_template
//
//  Created by OLUNUGA Mayowa on 19/01/2020.
//  Copyright © 2020 OLUNUGA Mayowa. All rights reserved.
//

import Foundation

class AuthRemoteDataSource : AuthDataSourceProtocol {
    func login(requestModel: LoginRequestModel, completion: @escaping (Result<LoginResponseModel>) -> Void) {
        debugPrint("Calling auth remote data source")
        
        //Simulate newtwork call
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { // Change `2.0` to the
            let responseModel = LoginResponseModel(userId: "13")
            let result = Result.success(responseModel)
            debugPrint("Calling auth remote data source done")
            completion(result)
        }
    }
    
    func signUp(requestModel: SignUpRequestModel, completion: (Result<Any>) -> Void) {
        
    }
    
    
}
