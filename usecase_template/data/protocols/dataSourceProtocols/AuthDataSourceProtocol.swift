//
//  AuthDataSourceProtocol.swift
//  usecase_template
//
//  Created by OLUNUGA Mayowa on 19/01/2020.
//  Copyright © 2020 OLUNUGA Mayowa. All rights reserved.
//

import Foundation
protocol AuthDataSourceProtocol {
    func login(requestModel : LoginRequestModel, completion : @escaping (Result<LoginResponseModel>)->Void)
    func signUp(requestModel : SignUpRequestModel, completion : (Result<Any>)->Void)
}
