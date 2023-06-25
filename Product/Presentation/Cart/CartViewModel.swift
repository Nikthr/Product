//
//  CartViewModel.swift
//  Product
//
//  Created by Nikhil T on 09/06/23.
//

import Foundation
import Combine

class CartViewModel:ObservableObject {
    @Published var cartItems:[ProductModel] = []
    var passthroughSub:PassthroughSubject<[ProductModel],Never>?
    let cartUseCase:CartUseCaseInterface
    var anyCancellable:AnyCancellable?
    
    var totalPrice: Double {
        cartItems.reduce(0) { $0 + $1.discounterPrice * Double($1.totalCartCount) }
    }
    
    init(cartUseCase: CartUseCaseInterface) {
        self.cartUseCase = cartUseCase
    }
    
    func getCartItems() {
        passthroughSub = self.cartUseCase.observerForCartValues()
        anyCancellable = passthroughSub?.sink(receiveValue: { items in
            self.cartItems = items
        })
        self.cartUseCase.getCartItems()
    }
    
    
    func cartValueChanged(_ prod:ProductModel,update:StepperCompUpdate) {
        self.cartUseCase.updateCartItem(prod: prod, update: update)
    }
}
