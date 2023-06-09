//
//  ProductModel+CoreDataProperties.swift
//  Product
//
//  Created by Nikhil T on 08/06/23.
//
//

import Foundation
import CoreData

extension ProductModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductModel> {
        return NSFetchRequest<ProductModel>(entityName: "ProductModel")
    }
}

extension ProductModel : Identifiable {

}
