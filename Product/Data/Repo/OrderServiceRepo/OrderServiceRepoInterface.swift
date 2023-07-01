//
//  HomeRepoInterface.swift
//  Product
//
//  Created by Nikhil T on 16/05/23.
//

import Foundation
import Combine
protocol OrderServiceRepoInterface {
    func getOrderDetails(jsonName:String,exten:String) -> AnyPublisher<Data,Error>
}
