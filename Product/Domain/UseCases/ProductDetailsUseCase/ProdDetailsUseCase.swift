//
//  ProductUseCase.swift
//  Product
//
//  Created by Nikhil T on 18/05/23.
//
import Combine
import Foundation
struct ProdDetailsUseCase:ProdDetailsUseCaseInterface {
    
    let productRepo:ProdDetailsRepoInterface
    
    init(productRepo: ProdDetailsRepoInterface) {
        self.productRepo = productRepo
    }
    func getProdDetails(prodId:String) -> AnyPublisher<ProdDetailsModel,Error> {
        productRepo.getProdDetails(jsonName: Constants.ProdScreen.prodDetails,
                                  exten: Constants.Common.jsonExten)
        .decode(type: ProdDetailsModel.self, decoder: JSONDecoder())
        .eraseToAnyPublisher()
    }
    
    func updateCartItem(prod:ProductModel,update:StepperCompUpdate) {
    }
}
