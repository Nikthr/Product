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
//    func updateCartItem(update:CartUpdate,
//                        prod:ProductModel)throws {
        //check if already present
        //If yes update
        //else insert
//        let request = NSFetchRequest<CartItems>(entityName: "CartItems")
//        request.predicate = NSPredicate(format: "prodid == %@", prod.id)
//        do {
//            let prods = try DBController.shared.context.fetch(request)
//
//            //update
//            if let cartItem = prods.first, let data = cartItem.item  {
//                var prodModel = try JSONDecoder().decode(ProductModel.self, from: data)
//                prodModel.totalCartCount = (update == .incr) ? (prodModel.totalCartCount + 1) : (prodModel.totalCartCount - 1)
//                if(prodModel.totalCartCount == 0) {
//                    //remove item from db
//                } else {
//                    //update
//                    let prodData = try JSONEncoder().encode(prodModel)
//                    cartItem.item = prodData
//                    try DBController.shared.save()
//                }
//            }else {//insert
//                var prodItem = prod
//                prodItem.totalCartCount = prodItem.totalCartCount + 1
//                let prodData = try JSONEncoder().encode(prodItem)
//                let cartItem = CartItems(context: DBController.shared.context)
//                cartItem.item = prodData
//                cartItem.prodid = prodItem.id
//                try DBController.shared.save()
//            }
            
//        }catch {
//            throw error
//        }
    }
    

