//
//  SizeCell.swift
//  PizzaWorld
//
//  Created by Shadi Elattar on 8/14/21.
//

import UIKit

class SizeCell: UICollectionViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var checkMark_iv: UIImageView!
    @IBOutlet weak var img_iv: UIImageView!
    @IBOutlet weak var mainLable: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    private let unSelectedColor = UIColor.lightGray
    private let selectedColor = UIColor.systemRed
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setCellUnSelected()
    }
    
    
    func configure(_ viewModel: SizeItemCellViweModel){
        mainLable.text = viewModel.topString
        
    }
    
    func setCellSelected(){
        containerView.layer.borderColor = selectedColor.cgColor
        checkMark_iv.isHidden = false
        img_iv.image = #imageLiteral(resourceName: "Selectedpizza")
        let labels = [mainLable,descLabel]
        labels.forEach({$0?.textColor = selectedColor})
        
        priceLabel.textColor = .systemGreen
    }
    
    func setCellUnSelected(){
        containerView.layer.borderColor = unSelectedColor.cgColor
        checkMark_iv.isHidden = true
        img_iv.image = #imageLiteral(resourceName: "UnselecrdPizza")
        
        let labels = [mainLable,descLabel,priceLabel]
        labels.forEach({$0?.textColor = unSelectedColor})
    }
    
    override var isSelected: Bool{
        didSet{
            if isSelected{
                setCellSelected()
            }else{
                setCellUnSelected()
            }
        }
    }
    
}
