//
//  ProductUseCaseInterface.swift
//  Product
//
//  Created by Nikhil T on 18/05/23.
//

import Foundation
import Combine
protocol ProdListUseCaseInterface {
    func getProdList(catHeirarchy:[String]) -> AnyPublisher<ProductListModel,Error>
//    func updateCartItem(prod:ProductModel)throws
}
