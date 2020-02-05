//
//  AuthRepoProtocol.swift
//  usecase_template
//
//  Created by OLUNUGA Mayowa on 19/01/2020.
//  Copyright © 2020 OLUNUGA Mayowa. All rights reserved.
//

import Foundation

protocol AuthRepoProtocol {
    func login(requestModel : LoginRequestModel, completion :@escaping (_ result: Result<LoginResponseModel>)-> Void)
    func signUp(requestModel : SignUpRequestModel, completion : (_ result :Result<Any>)->Void)
}
