//
//  ItemDetailesViewModel.swift
//  Pizza Station
//
//  Created by Shadi Elattar on 10/29/21.
//

import Foundation
import RxCocoa
import RxSwift

protocol itemDetailesModelOutput {
    var displayManiData: PublishSubject<ProductViewModel>  {get set}
 
}

protocol itemDetailesModelInputs {
    func viewDidLoad()
   
}


class itemDetailesViewModel: BaseViewModel,itemDetailesModelOutput & itemDetailesModelInputs {
  
    
    let product: Product
    
    init(product: Product) {
        self.product = product
    }
    
    //output
    var displayManiData: PublishSubject<ProductViewModel> = .init()
    
    
    //Input
    func viewDidLoad() {
        let productModel = ProductViewModel(product)
        displayManiData.onNext(productModel)
    }
    


    
    
    
    
}
