//
//  ProductUseCaseInterface.swift
//  Product
//
//  Created by Nikhil T on 18/05/23.
//

import Foundation
import Combine
protocol ProductCatUseCaseInterface {
    func getCategories() -> AnyPublisher<Categories,Error>
}
