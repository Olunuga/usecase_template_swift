//
//  BaseResponseModel.swift
//  usecase_template
//
//  Created by OLUNUGA Mayowa on 29/01/2020.
//  Copyright © 2020 OLUNUGA Mayowa. All rights reserved.
//

import Foundation
struct BaseResponseModel<T: Decodable> : Decodable {
    var statusData : StatusData?
    var page : UInt32?
    var dataList : Array<T>?
    var data : T?
}
