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
    
    init() {
        useCase = ProdListUseCase(productRepo: ProdListRepoStub(), dbRepo: DBRepo())
    }
}

//Get Prod list based on category
extension ProductsViewModel {
    func getProdList(catHeirarchy:[String])  {
        cancellable = useCase.getProdList(catHeirarchy: catHeirarchy)
            .sink { error in
                print(error)
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
                print(model)
                self.products = model.prodlist
            }
    }
}

//Cart value changed
extension ProductsViewModel {
    func cartValueChanged(for prod:ProductModel) {
        try? useCase.updateCartItem(prod: prod)
    }
}
