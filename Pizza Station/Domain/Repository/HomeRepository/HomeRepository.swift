//
//  HomeRepository.swift
//  Pizza Station
//
//  Created by Shadi Elattar on 11/6/21.
//

import Foundation
import RxSwift
import RxCocoa

protocol HomeRepository {
    func fetchSliderData() -> Observable<[Slider]>
    func fetchPopualrData() -> Observable<[Product]>
}


class HomeRepositoryImpl: HomeRepository{
    
    
    
    let networkClient: NetworkCLient
    
    init(networkClient: NetworkCLient = NetworkCLient()) {
        self.networkClient = networkClient
    }
    
    func fetchSliderData()-> Observable<[Slider]>{
        Observable<[Slider]>.create { [weak self] (item) -> Disposable in
            
            self?.networkClient.performRequest(ResponseObject<[Slider]>.self, router: MainRouter.slider) { result in
                switch result{
                case .success(let data):
                    item.onNext(data.data)
                    item.onCompleted()
                case .failure(let error):
                    item.onError(error)
                }
            }
            
            return Disposables.create()
        }
        
    }
    
    
    func fetchPopualrData() -> Observable<[Product]> {
        Observable<[Product]>.create { [weak self] (product) in
            self?.networkClient.performRequest(ResponseObject<[Product]>.self, router: FeedRouter.popular) { result in
                switch result{
                case .success(let data):
                    product.onNext(data.data)
                    product.onCompleted()
                case .failure(let error):
                    product.onError(error)
                }
            }
            
            return Disposables.create()
        }
    }
    
    
    
}
