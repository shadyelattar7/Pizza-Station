//
//  HomeVC.swift
//  Pizza Station
//
//  Created by Shadi Elattar on 10/11/21.
//

import UIKit
import RxCocoa
import RxSwift
import Alamofire

class HomeVC: BaseWireFrame<HomeViewModel> {

    @IBOutlet weak var sliderCollV: UICollectionView!
    @IBOutlet weak var viewX: UIView!
    @IBOutlet weak var popularTableView: UITableView!
    
   

  //  let disposbag = DisposeBag()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        registerCell()
        SetupPopularTableView()
        viewModel.ViewDidLoad()
     
        
    }
    
    override func bind(viewModel: HomeViewModel) {
        viewModel.slideToItemAtIndex.subscribe { index in
            self.sliderCollV.scrollToItem(at: IndexPath(row: index, section: 0), at: .centeredHorizontally, animated: true)
    
        }.disposed(by: disposeBag)
        
        
        viewModel.sliderImg.bind(to: sliderCollV.rx.items(cellIdentifier: String(describing: SliderCell.self), cellType: SliderCell.self)) { (row,item,cell) in
            cell.configure(item)
                
        }.disposed(by: disposeBag)
        
        viewModel.navigateToItemDetailes.subscribe { [weak self] product in
            guard let self = self, let product = product.element else {return}
            self.coordinator.Main.navigate(to: .itemDetails(product: product))
        }.disposed(by: disposeBag)

    }

    private func setupView(){
        viewX.layer.cornerRadius = 80
        viewX.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        sliderCollV.rx.setDelegate(self).disposed(by: disposeBag)
       
    }
    
    private func registerCell(){
        sliderCollV.registerNIB(SliderCell.self)
        popularTableView.registerNIB(cell: PopularCell.self)
    }
   
    private func SetupPopularTableView(){
        popularTableView.rx.setDelegate(self).disposed(by: disposeBag)
        
        viewModel.popular.bind(to: popularTableView.rx.items(cellIdentifier: String(describing: PopularCell.self), cellType: PopularCell.self)){ (row,item,cell) in
//            cell.productName_lbl.text = item.title
            cell.ratingView.ConfigurasWithRating(rating: item.rating ?? 0, style: .compact)
        }.disposed(by: disposeBag)
        
        popularTableView.rx.itemSelected.subscribe { [weak self] indexPath in
            guard let self = self, let indexPath = indexPath.element else {return}
            print("IndexPath: \(indexPath)")
            self.viewModel.didSelectItemAtItemPath(indexPath)
        }.disposed(by: disposeBag)
        
//        popularTableView.rx.modelSelected(Product.self).subscribe { model in
//            print("Model seleced: \(model)")
//        }.disposed(by: disposbag)
    }
  
    
}


//MARK:- Slider Data Source
extension HomeVC: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == self.sliderCollV{
            viewModel.currentIndex = Int(scrollView.contentOffset.x / sliderCollV.frame.size.width)

        }
    }
}
