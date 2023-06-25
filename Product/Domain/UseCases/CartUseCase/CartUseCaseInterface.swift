//
//  ProductUseCaseInterface.swift
//  Product
//
//  Created by Nikhil T on 18/05/23.
//

import Foundation
import Combine
protocol CartUseCaseInterface {
    func updateCartItem(prod:ProductModel,update:StepperCompUpdate)
    func observerForCartValues()->PassthroughSubject<[ProductModel],Never>
    func getCartItems() 
}
