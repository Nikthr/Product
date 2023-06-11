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
        if( !dbRepo.checkIfProductsAddedFromStub()) {
            let prodListToPublish = productRepo.getProdList(jsonName: Constants.ProdScreen.prodList,
                                                            exten: Constants.Common.jsonExten)
            .decode(type: ProductListModel.self, decoder: JSONDecoder(context: DBController.shared.context))
            do {
                try prodListToPublish.eraseToAnyPublisher()
                    .sink(receiveCompletion: { err in
                        print(err)
                    }, receiveValue: { model in
                        try? DBController.shared.save()
                    })
                    

                if let directoryLocation = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).last {             print("Documents Directory: \(directoryLocation)Application Support")         }
            }catch{
                return Fail(outputType: ProductListModel.self, failure: error).eraseToAnyPublisher()
            }
            return prodListToPublish.eraseToAnyPublisher()
        } else {
            return dbRepo.fetchProductList()
        }
    }
    
    func updateCartItem(prod:ProductModel)throws {
         try dbRepo.updateCartItem(update: .incr,
                                   prod:prod)
    }
}
