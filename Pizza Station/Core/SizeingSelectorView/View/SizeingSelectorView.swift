//
//  SizeingSelectorView.swift
//  Pizza Station
//
//  Created by Shadi Elattar on 10/30/21.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa


class SizeingSelectorView: NibLoadingView, UIScrollViewDelegate{
    @IBOutlet weak var collectionView: UICollectionView!
    
    let disposeBag = DisposeBag()
    
    let viewModel: SizesSelectorViewModel = .init()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupCollection()
        registerCells()
    }
    
    func registerCells(){
        collectionView.registerNIB(SizeCell.self)
    }
    
    func setupCollection(){
        collectionView.rx.setDelegate(self).disposed(by: disposeBag)
        viewModel.output.itemsObservable.bind(to: collectionView.rx.items(cellIdentifier: String(describing: SizeCell.self), cellType: SizeCell.self)){ (index,model,cell) in
            cell.configure(model)
        }.disposed(by: disposeBag)
    }
    
    
    
}

extension SizeingSelectorView: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.size.width / CGFloat(viewModel.output.numberOfItem)
        let height = collectionView.bounds.height
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0 
    }
}
