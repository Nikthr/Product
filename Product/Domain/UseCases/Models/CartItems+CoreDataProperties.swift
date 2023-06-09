//
//  CartItems+CoreDataProperties.swift
//  Product
//
//  Created by Nikhil T on 08/06/23.
//
//

import Foundation
import CoreData


extension CartItems {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CartItems> {
        return NSFetchRequest<CartItems>(entityName: "CartItems")
    }

    @NSManaged public var item: Data?
    @NSManaged public var prodid: String?

}

extension CartItems : Identifiable {

}
