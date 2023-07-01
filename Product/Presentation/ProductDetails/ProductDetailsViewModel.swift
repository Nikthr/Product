//
//  ProductsViewModel.swift
//  Product
//
//  Created by Nikhil T on 18/05/23.
//

import Foundation
import Combine

class ProductDetailsViewModel:ObservableObject {
    @Published var detailsModel:ProdDetailsModel?
    @Published var error:CustomError?
    var prod:ProductModel
    private let useCase:ProdDetailsUseCaseInterface
    private var cancellable:AnyCancellable?
    
    init(prod:ProductModel,useCase:ProdDetailsUseCaseInterface) {
        self.useCase = useCase
        self.prod = prod
    }

    func getProdDetails() {
        cancellable = useCase.getProdDetails(prodId: self.prod.id)
            .sink { error in
                switch error {
                case .failure(let err) :
                    if let err = err as? CustomError {
                        self.error = err
                    }else {
                        self.error = CustomError(error: Errors.genericError)
                    }
                case .finished:
                    break
                }
            } receiveValue: { details in
                self.detailsModel = details
            }

    }
    
    func cartValueChanged() {
        self.useCase.updateCartItem(prod: self.prod, update: .incr)
    }
    
    func addToCartFromSimilarProds(addedItem:ProductModel) {
        self.useCase.updateCartItem(prod: addedItem, update: .incr)
    }
    
    func changeAddressSelected() {
        print("Change address selected")
    }
}
