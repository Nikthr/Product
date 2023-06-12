//
//  HomeViewModel.swift
//  Product
//
//  Created by Nikhil T on 03/05/23.
//

import Foundation
import Combine
class HomeViewModel:ObservableObject {
    private var useCase:HomeUseCaseInterface
    private var cancellable:AnyCancellable?
    
    //Publish vars to notify View
    @Published var homeModel:HomeModel?
    @Published var topRatedImages:[String] = []
    @Published var error:CustomError?
    
    init() {
        useCase = HomeUseCase(homeRepo: HomeRepoStubs())
    }
    
    func readData() {
        cancellable = useCase.getHomePageData(zipCode: nil)
            .sink(){ error in
                switch error {
                case .failure(let err) :
                    if let err = err as? CustomError {
                        self.error = err
                    }else {
                        self.error = CustomError(error: Errors.genericError)
                    }
                case .finished:
                    DBController.shared.context.reset()
                }
            } receiveValue :{ model in
                self.homeModel = model
                self.setTopRatedImages()
            }
    }
    
    func setTopRatedImages() {
        if let topRated = homeModel?.toprated {
            topRatedImages.removeAll()
            var images:[String] = []
            for product in topRated {
                if let image = product.images.first {
                    images.append(image)
                }
            }
            self.topRatedImages = images
        }
    }
}
