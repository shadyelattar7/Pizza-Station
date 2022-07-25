//
//  QuantityView.swift
//  Pizza Station
//
//  Created by Shadi Elattar on 10/31/21.
//

import UIKit
import RxSwift
import RxCocoa

class QuantityView: NibLoadingView {
    
    @IBOutlet weak var value_lbl: UILabel!
    
    var currentValue: BehaviorRelay<Int> = .init(value: 0)
  
    lazy var currentValueObservable: Observable<Int> = {
        return currentValue.asObservable()
    }()
    
    
    let disposeBag = DisposeBag()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup(){
        currentValueObservable.subscribe { [weak self] quantity in
            guard let self = self else {return}
            self.value_lbl.text = "\(quantity.element ?? 0)"
        }.disposed(by: disposeBag)
    }
    
    @IBAction func didPressPlus(_ sender: Any) {
        currentValue.accept(currentValue.value + 1)
    }
    
    @IBAction func didPressMinus(_ sender: Any) {
        guard currentValue.value > 0 else {return}
        currentValue.accept(currentValue.value - 1)
    }
    
}
