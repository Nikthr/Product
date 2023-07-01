//
//  DBController.swift
//  Product
//
//  Created by Nikhil T on 07/06/23.
//

import Foundation
import Combine
class CartData {
    static let shared = CartData()
    
    private var cartItem:[ProductModel] = []
    public var passthrouhCartItems = PassthroughSubject<[ProductModel],Never>()
   
    private init() {
    }
    
    func observer() -> PassthroughSubject<[ProductModel],Never> {
        return passthrouhCartItems
    }
    
    func getcartItems() {
        passthrouhCartItems.send(cartItem)
    }
    
    func removeCartItems() {
        cartItem.removeAll()
        passthrouhCartItems.send([])
    }
    
    func updateCart(product:ProductModel,update:StepperCompUpdate)  {
        //1.check if incr/decr
        //2.if decr reduce count, if count reaches zero remove from list
        //3.if incr check if item exists, if yes simply incr count otherwise just add
        guard let index = self.cartItem.firstIndex(where: {$0.id == product.id}) else {
            //new item
            var productModel = product
            productModel.totalCartCount += 1
            self.cartItem.append(productModel)
            passthrouhCartItems.send(self.cartItem)
            return
        }
        
        var model = self.cartItem[index]
        if(update == .decr) {
            if model.totalCartCount > 1 {
                model.totalCartCount -= 1
                self.cartItem[index] = model
            } else {
                self.cartItem.remove(at: index)
            }
        } else {//incr
            model.totalCartCount += 1
            self.cartItem[index] = model
        }
        
        passthrouhCartItems.send(self.cartItem)
    }
}
