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
    
    public override func awakeFromFetch() {
        self.discounterPrice = self.price - (price * discountPercentage/100)
    }
}

extension ProductModel : Identifiable {

}
