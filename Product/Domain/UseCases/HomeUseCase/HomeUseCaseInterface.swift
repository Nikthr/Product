//
//  HomeUseCaseInterface.swift
//  Product
//
//  Created by Nikhil T on 16/05/23.
//

import Foundation
import Combine
protocol HomeUseCaseInterface {
    func getHomePageData(zipCode:Int?) -> AnyPublisher<HomeModel,Error>

}
