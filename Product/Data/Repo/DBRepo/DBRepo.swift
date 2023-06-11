//
//  DBRepoInterface.swift
//  Product
//
//  Created by Nikhil T on 07/06/23.
//

import Foundation
import CoreData
import Combine

struct DBRepo {}
extension DBRepo:DBRepoInterface {
    func updateCartItem(update:CartUpdate,
                        prod:ProductModel)throws {
        if(update == .incr) {
            prod.totalCartCount += 1
        } else {
            prod.totalCartCount -= 1
        }
        try! DBController.shared.save()
    }
    
    func checkIfProductsAddedFromStub() -> Bool {
        //Remove already existing from context
        DBController.shared.context.reset()
        var itemExists = false
        do {
            let count = try DBController.shared.context.count(for:ProductModel.fetchRequest())
            itemExists = (count > 0)
        }catch {
            fatalError("Failed to fetch from DB")
        }
        return itemExists
    }
    
    func fetchProductList() -> AnyPublisher<ProductListModel,Error> {
        do {
            let prodList = try DBController.shared.context.fetch(ProductModel.fetchRequest()) as [ProductModel]
            print(prodList)
            return Just(ProductListModel(prodlist: prodList))
                .mapError { error in
                CustomError(error: Errors.genericError)
            }
                .eraseToAnyPublisher()
        }catch {
            return Fail(outputType: ProductListModel.self, failure: error).eraseToAnyPublisher()
        }
    }
}
    

