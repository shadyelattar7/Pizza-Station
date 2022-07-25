//
//  SizeItemCellViweModel.swift
//  Pizza Station
//
//  Created by Shadi Elattar on 10/31/21.
//

import Foundation

struct SizeItemCellViweModel {
    var topString: String
    
    init(size: Sizes, showPrice: Bool) {
        self.topString = size.size ?? ""
    }
    
    
}
