//
//  HomeViewModel.swift
//  Pizza Station
//
//  Created by Shadi Elattar on 10/11/21.
//

import Foundation
import RxSwift
import RxCocoa


protocol HomeViewModelOutputs {
    var slideToItemAtIndex: PublishSubject<Int> {get set}
    var navigateToItemDetailes: PublishSubject<Product> {get set}
}

protocol HomeViewModelInputs {
    func ViewDidLoad()
    func handleTimerSliderImage()
    func didSelectItemAtItemPath(_ indexPath: IndexPath)
}

class HomeViewModel: BaseViewModel, HomeViewModelOutputs & HomeViewModelInputs{
    let homeRepository: HomeRepository
    let disposedBag = DisposeBag()
    
    
    init(homeRepository: HomeRepository) {
        self.homeRepository = homeRepository
    }
    
    
    var sliderImg: BehaviorRelay<[SliderViewModel]> = .init(value: [])
    var currentIndex = 0
    var timer: Timer?
    
    var popular: BehaviorRelay<[ProductViewModel]> = .init(value: [])
    
    
    //Output
    var slideToItemAtIndex: PublishSubject<Int> = .init()
    var navigateToItemDetailes: PublishSubject<Product> = .init()
    
    //Input
    func ViewDidLoad(){
        setupTimer()
        fetchSliderData()
        fetchPopualrData()
    }
    
    
    func didSelectItemAtItemPath(_ indexPath: IndexPath) {
        let model = popular.value[indexPath.row]
        //   navigateToItemDetailes.onNext(model)
    }
    
    
    func setupTimer(){
        timer = Timer.scheduledTimer(timeInterval:  3.0 , target: self, selector: #selector(handleTimerSliderImage), userInfo: nil, repeats: true)
    }
    
    @objc func handleTimerSliderImage(){
        let desiredScrollPostion = (currentIndex < sliderImg.value.count - 1) ? currentIndex + 1 : 0
        slideToItemAtIndex.onNext(desiredScrollPostion)
    }
    
    //MARK:- Public Var
    var numberOfItems: Int {
        return sliderImg.value.count
    }
    
    
    
    //MARK:- Network Calls
    func fetchSliderData(){
        isLoading.onNext(true)
        homeRepository.fetchSliderData().subscribe { [weak self] (items) in
            self?.isLoading.onNext(false)
            print("I go data: \(items)")
            //  self?.displayError.onNext("No Error Connection, please try again.")
            self?.sliderImg.accept(items.map(SliderViewModel.init))
        } onError: { (error) in
            self.isLoading.onNext(false)
            print("I got error \(error)")
        } onCompleted: {
            self.isLoading.onNext(false)
        }.disposed(by: disposedBag)
        
    }
    
    
    func fetchPopualrData(){
        isLoading.onNext(true)
        homeRepository.fetchPopualrData().subscribe {(product) in
            self.isLoading.onNext(false)
            self.popular.accept(product.map(ProductViewModel.init))
        } onError: { (error) in
            self.isLoading.onNext(false)
            print("I got error \(error)")
        } onCompleted: {
            self.isLoading.onNext(false)
        }.disposed(by: disposedBag)
        
    }
    
}
