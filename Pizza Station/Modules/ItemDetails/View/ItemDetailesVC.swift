//
//  ItemDetailesVC.swift
//  PizzaWorld
//
//  Created by Shadi Elattar on 8/1/21.
//

import UIKit

class ItemDetailesVC: BaseWireFrame<itemDetailesViewModel> {

    @IBOutlet weak var pizzaLabel: UILabel!
    @IBOutlet weak var pizzaIngrients_lbl: UILabel!
    @IBOutlet weak var rateingView: RatingView!
    @IBOutlet weak var addToCartButton: UIButton!
    @IBOutlet weak var pizzaOpationsView: PizzaOptionsView!
    @IBOutlet weak var descTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
    }

    override func bind(viewModel: itemDetailesViewModel) {
        
        viewModel.displayManiData.subscribe { [weak self] viewModel in
            guard let self = self, let viewModel = viewModel.element else {return}
            self.setupView(with: viewModel)
        }.disposed(by: disposeBag)
        
//        pizzaOpationsView.quantityView.currentValueObservable.subscribe { [weak self] quantity in
//            guard let self = self else {return}
//            self.addToCartButton.setTitle(<#T##title: String?##String?#>, for: <#T##UIControl.State#>)
//        }.disposed(by: disposeBag)
        
    }

    private func setupView(with viewModel: ProductViewModel){
        self.pizzaLabel.text = viewModel.mainTitle
        self.rateingView.ConfigurasWithRating(rating: viewModel.rating)
    }
    
    @IBAction func didPressAddToCart(_ sender: Any) {
        
    }
    
    
}
