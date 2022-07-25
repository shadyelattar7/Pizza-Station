//
//  SliderViewModel.swift
//  Pizza Station
//
//  Created by Shadi Elattar on 11/6/21.
//

import Foundation

class SliderViewModel{
    var title: String
    var buttonTitile: String
    var image: String
    var product: Product
    var category: String
    var cookTime: String
    
    
    init(_ slider: Slider) {
        self.buttonTitile = slider.button_title ?? ""
        self.title = slider.product.title ?? ""
        self.image = slider.image ?? ""
        self.product = slider.product
        self.category = slider.product.category ?? ""
        self.cookTime = slider.product.cook_time ?? ""
        
    }
}
