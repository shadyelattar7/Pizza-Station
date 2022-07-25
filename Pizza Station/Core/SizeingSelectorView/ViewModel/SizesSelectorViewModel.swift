//
//  SizesSelectorViewModel.swift
//  Pizza Station
//
//  Created by Shadi Elattar on 10/30/21.
//

import Foundation
import RxCocoa
import RxSwift


protocol SizesSelectorViewModelInput {
    
}

protocol SizesSelectorViewModelOutput {
    var itemsObservable: Observable<[SizeItemCellViweModel]> {get}
    var numberOfItem: Int {get}
}

class SizesSelectorViewModel: ViewModel, SizesSelectorViewModelInput, SizesSelectorViewModelOutput{
    
    var input: SizesSelectorViewModelInput{
        return self
    }
    
    var output: SizesSelectorViewModelOutput{
        return self
    }
    
    private var items: BehaviorRelay<[Sizes]> = .init(value: [])
    
    private var itemsViewModel: BehaviorRelay<[SizeItemCellViweModel]> = .init(value: [])
    
    //MARK:- Outputs
    var itemsObservable: Observable<[SizeItemCellViweModel]>
    
    var numberOfItem: Int{
        return items.value.count
    }
    
    
    init() {
        itemsObservable = itemsViewModel.asObservable()
        
        
        let mappedItems: [SizeItemCellViweModel] = items.value.map { size in
            return .init(size: size, showPrice: true)
        }
        
        itemsViewModel.accept(mappedItems)
        
    }
    
}
