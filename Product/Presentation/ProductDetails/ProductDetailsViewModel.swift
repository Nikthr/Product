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
    var prodId:String
    private let useCase:ProdDetailsUseCaseInterface
    private var cancellable:AnyCancellable?
    
    init(prodId:String) {
        useCase = ProdDetailsUseCase(productRepo: ProdDetailsRepoStub())
        self.prodId = prodId
    }

    func getProdDetails() {
       cancellable = useCase.getProdDetails(prodId: prodId)
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
            } receiveValue: { details in
                print(details)
                self.detailsModel = details
            }

    }
}
