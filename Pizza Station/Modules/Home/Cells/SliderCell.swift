//
//  SliderCell.swift
//  PizzaWorld
//
//  Created by Shadi Elattar on 7/17/21.
//

import UIKit

class SliderCell: UICollectionViewCell {

    @IBOutlet weak var pizzaImg_iv: UIImageView!
    @IBOutlet weak var rate: RatingView!
    @IBOutlet weak var orderNowButton: UIButton!
    @IBOutlet weak var title_lbl: UILabel!
    @IBOutlet weak var time_lbl: UILabel!
    @IBOutlet weak var category_lbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        rate.ratingStackview.removeAllArrangedSubviews()
    }
    
    func configure(_ viewModel: SliderViewModel){
        
        self.orderNowButton.setTitle(viewModel.buttonTitile, for: .normal)
        self.title_lbl.text = viewModel.title
        self.pizzaImg_iv.getImage(imageUrl: viewModel.image)
        self.rate.ConfigurasWithRating(rating: viewModel.product.rating ?? 0)
        self.time_lbl.text = viewModel.cookTime
        self.category_lbl.text = viewModel.category
        
    }

}
