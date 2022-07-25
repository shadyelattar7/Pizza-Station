//
//  SizeCell.swift
//  PizzaWorld
//
//  Created by Shadi Elattar on 8/14/21.
//

import UIKit

class SizeCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.setView(corner: 5)
        self.layer.borderWidth = 1
        self.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
    }

}
