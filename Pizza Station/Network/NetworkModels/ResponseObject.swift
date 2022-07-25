//
//  responseObject.swift
//  Pizza Station
//
//  Created by Shadi Elattar on 11/6/21.
//

import Foundation

struct ResponseObject<T:  Decodable>: Decodable {
    var message: String
    var status: Bool
    var data: T
    
}
