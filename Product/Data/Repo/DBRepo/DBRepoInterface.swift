//
//  DBRepoInterface.swift
//  Product
//
//  Created by Nikhil T on 07/06/23.
//

import Foundation
import Combine
enum CartUpdate {
    case incr
    case decr
}

protocol DBRepoInterface {
    func updateCartItem(update:CartUpdate,
                        prod:ProductModel
                        )throws
    func checkIfProductsAddedFromStub() ->Bool
    func fetchProductList() ->AnyPublisher<ProductListModel,Error>

}
