//
//  Slider.swift
//  Pizza Station
//
//  Created by Shadi Elattar on 11/5/21.
//

import Foundation

struct Slider: Codable {
    
    let id : Int?
    let image : String?
    let button_title : String?
    let product : Product

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case image = "image"
        case button_title = "button_title"
        case product = "product"
    }
}
