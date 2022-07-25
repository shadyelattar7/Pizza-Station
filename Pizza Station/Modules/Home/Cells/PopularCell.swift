//
//  PopularCell.swift
//  PizzaWorld
//
//  Created by Shadi Elattar on 7/21/21.
//

import UIKit

class PopularCell: UITableViewCell {
    @IBOutlet weak var ratingView: RatingView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
