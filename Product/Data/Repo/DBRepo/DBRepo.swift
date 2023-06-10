//
//  DBRepoInterface.swift
//  Product
//
//  Created by Nikhil T on 07/06/23.
//

import Foundation
import CoreData
struct DBRepo {}

extension DBRepo:DBRepoInterface {
    func updateCartItem(update:CartUpdate,
                        prod:ProductModel)throws {
        if(update == .incr) {
            prod.totalCartCount += 1
        } else {
            prod.totalCartCount -= 1
        }
        try! DBController.shared.save()
    }
}
    

