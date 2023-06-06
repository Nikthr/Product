//
//  ProductUseCase.swift
//  Product
//
//  Created by Nikhil T on 18/05/23.
//
import Combine
import Foundation
struct ProductCatUseCase:ProductCatUseCaseInterface {
    let productRepo:ProductCatRepoInterface
    
    init(productRepo: ProductCatRepoInterface) {
        self.productRepo = productRepo
    }
    func getCategories() -> AnyPublisher<Categories,Error> {
        productRepo.getCategories(jsonName: Constants.ProdScreen.catjsonName,
                                  exten: Constants.Common.jsonExten)
        .decode(type: Categories.self, decoder: JSONDecoder())
        .eraseToAnyPublisher()
    }
}
