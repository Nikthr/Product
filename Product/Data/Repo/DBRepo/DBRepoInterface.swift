//
//  DBRepoInterface.swift
//  Product
//
//  Created by Nikhil T on 07/06/23.
//

import Foundation
import Combine

protocol DBRepoInterface {
    func updateCartItem(prod:ProductModel,update:StepperCompUpdate)
    func observerForCartValues() -> PassthroughSubject<[ProductModel],Never>
    func getCartItems()
    func removeCartItems()
}
