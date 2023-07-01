//
//  ProductUseCase.swift
//  Product
//
//  Created by Nikhil T on 18/05/23.
//
import Combine
import Foundation

struct OrderUseCase:OrderUseCaseInterface {
    private let orderServiceRepo:OrderServiceRepoInterface
    private let dbRepo:DBRepoInterface
    init( order:OrderServiceRepoInterface,dbRepo:DBRepoInterface) {
        self.orderServiceRepo = order
        self.dbRepo = dbRepo
    }
}

extension OrderUseCase {
    func getOrderDetails() -> AnyPublisher<OrderDetailsModel, Error> {
        orderServiceRepo.getOrderDetails(jsonName: Constants.OrderScreen.orderDetails,
                                         exten: Constants.Common.jsonExten)
        .decode(type: OrderDetailsModel.self, decoder: JSONDecoder())
        .eraseToAnyPublisher()
    }
    
    func removeCartItems() {
        dbRepo.removeCartItems()
    }
}
