//
//  ProductUseCase.swift
//  Product
//
//  Created by Nikhil T on 18/05/23.
//
import Combine
import Foundation
struct ProdListUseCase:ProdListUseCaseInterface {
    
    let productRepo:ProdListRepoInterface
    
    init(productRepo: ProdListRepoInterface) {
        self.productRepo = productRepo
    }
    func getProdList(catHeirarchy:[String]) -> AnyPublisher<ProductListModel,Error> {
        productRepo.getProdList(jsonName: Constants.ProdScreen.prodList,
                                  exten: Constants.Common.jsonExten)
        .decode(type: ProductListModel.self, decoder: JSONDecoder())
        .eraseToAnyPublisher()
    }
}
