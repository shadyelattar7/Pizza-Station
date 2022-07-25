//
//  ProductViewModel.swift
//  Pizza Station
//
//  Created by Shadi Elattar on 10/29/21.
//

import Foundation

class ProductViewModel{
    
    let mainTitle: String
    let rating: Int

    init(_ product: Product) {
        self.mainTitle = "Product Title: \(product.title)"
        self.rating = product.rating ?? 0
    }
}
