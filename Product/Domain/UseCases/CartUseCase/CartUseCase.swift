//
//  ProductUseCase.swift
//  Product
//
//  Created by Nikhil T on 18/05/23.
//
import Combine
import Foundation

struct CartUseCase:CartUseCaseInterface {
    private let dbRepo:DBRepoInterface
    init( dbRepo:DBRepoInterface) {
        self.dbRepo = dbRepo
    }
}

extension CartUseCase {
    func updateCartItem(prod:ProductModel,update:StepperCompUpdate) {
        dbRepo.updateCartItem(prod:prod, update: update)
    }
    
    func observerForCartValues()->PassthroughSubject<[ProductModel],Never> {
        return dbRepo.observerForCartValues()
    }
  
    func getCartItems() {
        dbRepo.getCartItems()
    }
}
