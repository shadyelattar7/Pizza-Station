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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
    }

    override func bind(viewModel: itemDetailesViewModel) {
        viewModel.displayManiData.subscribe { [weak self] viewModel in
            self?.setupView(with: viewModel)
        }.disposed(by: disposeBag)
    }

    private func setupView(with viewModel: ProductViewModel){
        self.pizzaLabel.text = viewModel.mainTitle
        self.rateingView.ConfigurasWithRating(rating: viewModel.rating)
    }
}
