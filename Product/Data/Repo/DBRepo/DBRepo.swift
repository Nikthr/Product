//
//  DBRepoInterface.swift
//  Product
//
//  Created by Nikhil T on 07/06/23.
//

import Foundation
import CoreData
import Combine

struct DBRepo {}
extension DBRepo:DBRepoInterface {
    func updateCartItem(prod:ProductModel,update:StepperCompUpdate) {
        CartData.shared.updateCart(product: prod, update: update)
    }
    
    func observerForCartValues() -> PassthroughSubject<[ProductModel],Never> {
        CartData.shared.observer()
    }
    
    func getCartItems() {
        CartData.shared.getcartItems()
    }

}
    

