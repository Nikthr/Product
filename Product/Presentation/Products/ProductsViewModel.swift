//
//  ProductsViewModel.swift
//  Product
//
//  Created by Nikhil T on 18/05/23.
//

import Foundation
import Combine

class ProductsViewModel:ObservableObject {
    @Published var products:[ProductModel] = []
    @Published var error:CustomError?
    @Published var val:Int = 0
    private let useCase:ProdListUseCaseInterface
    private var cancellable:AnyCancellable?
    
    init(useCase:ProdListUseCaseInterface) {
        self.useCase = useCase
    }
}

//Get Prod list based on category
extension ProductsViewModel {
    func getProdList(catHeirarchy:[String])  {
        cancellable = useCase.getProdList(catHeirarchy: catHeirarchy)
            .sink { error in
                switch error {
                case .failure(let err) :
                    if let err = err as? CustomError {
                        self.error = err
                    }else {
                        self.error = CustomError(error: Errors.genericError)
                    }
                case .finished:
                    self.error = CustomError(error: Errors.genericError)
                }
            } receiveValue: { model in
                self.products = model.prodlist
            }
    }
}

extension ProductsViewModel {
    func cartValueChanged(for prod:ProductModel) {
        useCase.updateCartItem(prod: prod, update: .incr)
    }
}
