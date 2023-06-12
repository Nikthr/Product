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
    let dbRepo:DBRepoInterface
    init(productRepo: ProdListRepoInterface, dbRepo:DBRepoInterface) {
        self.productRepo = productRepo
        self.dbRepo = dbRepo
    }
}

extension ProdListUseCase {
    
    func getProdList(catHeirarchy:[String]) -> AnyPublisher<ProductListModel,Error> {
        return productRepo.getProdList(jsonName: Constants.ProdScreen.prodList,
                                                        exten: Constants.Common.jsonExten)
        .decode(type: ProductListModel.self, decoder: JSONDecoder(context: DBController.shared.context))
        .eraseToAnyPublisher()
    }
    
    func updateCartItem(prod:ProductModel)throws {
         try dbRepo.updateCartItem(update: .incr,
                                   prod:prod)
    }
}
