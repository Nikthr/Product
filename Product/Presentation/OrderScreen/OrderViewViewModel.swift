//
//  OrderViewViewModel.swift
//  Product
//
//  Created by Nikhil T on 26/06/23.
//

import Foundation
import Combine
struct PriceBreakUpModel:Hashable {
    let priceBreakUp:[PriceBreakUp]
    let total:PriceBreakUp
}

struct PriceBreakUp:Hashable {
    let title:String
    let price:String
}

extension PriceBreakUp:Identifiable {
    var id: String {
        return title
    }
}

class OrderViewViewModel:ObservableObject {
    private let useCase:OrderUseCaseInterface
    private var cancellable:AnyCancellable?
    @Published var error:CustomError?
    @Published var orderDetailModel:OrderDetailsModel?
    private var cartItems:[ProductModel] = []
    
    var priceModel:PriceBreakUpModel {
        let total = String(format:"%.2f",cartItems.reduce(0) { $0 + $1.discounterPrice * Double($1.totalCartCount) })
        
        return PriceBreakUpModel(priceBreakUp: [PriceBreakUp(title: "Item", price: total),PriceBreakUp(title: "Discount", price: "0.00")], total: PriceBreakUp(title: "Total", price: total))
    }
    
    init(useCase:OrderUseCaseInterface,cartItems:[ProductModel]) {
        self.useCase = useCase
        self.cartItems = cartItems
    }
    
    func getOrderDetails() {
        cancellable = useCase.getOrderDetails()
            .sink(receiveCompletion: { completion in
                switch(completion) {
                case .failure(let err):
                    if let err = err as? CustomError {
                        self.error = err
                    }else {
                        self.error = CustomError(error: Errors.genericError)
                    }
                case .finished:break
                }
            }, receiveValue: { orderModel in
                self.orderDetailModel = orderModel
            })
    }
    
    func removeCartItems() {
        useCase.removeCartItems()
    }
}
