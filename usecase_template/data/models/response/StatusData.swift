//
//  StatusData.swift
//  usecase_template
//
//  Created by OLUNUGA Mayowa on 29/01/2020.
//  Copyright © 2020 OLUNUGA Mayowa. All rights reserved.
//

import Foundation
struct StatusData : Decodable {
    var statusMessage : String
    var success : Bool
    var statusCode: UInt32
}
