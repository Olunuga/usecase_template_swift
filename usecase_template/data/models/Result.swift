//
//  Result.swift
//  usecase_template
//
//  Created by OLUNUGA Mayowa on 19/01/2020.
//  Copyright © 2020 OLUNUGA Mayowa. All rights reserved.
//

import Foundation
enum Result<T> {

    case success(T)
    case failed(String,UInt)
}
