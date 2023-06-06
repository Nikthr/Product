//
//  HomeRepoInterface.swift
//  Product
//
//  Created by Nikhil T on 16/05/23.
//

import Foundation
import Combine
protocol ProductCatRepoInterface {
    func getCategories(jsonName:String, exten:String) -> AnyPublisher<Data,Error>
}
