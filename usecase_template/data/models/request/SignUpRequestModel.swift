//
//  SignUpRequestModel.swift
//  usecase_template
//
//  Created by OLUNUGA Mayowa on 19/01/2020.
//  Copyright © 2020 OLUNUGA Mayowa. All rights reserved.
//

import Foundation

struct SignUpRequestModel : Encodable {
    var email : String
    var username : String
    var password : String
}
