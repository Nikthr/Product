//
//  ProdModel+CoreDataProperties.swift
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

// MARK: Generated accessors for images
extension ProductModel {

    @objc(addImagesObject:)
    @NSManaged public func addToImages(_ value: Images)

    @objc(removeImagesObject:)
    @NSManaged public func removeFromImages(_ value: Images)

    @objc(addImages:)
    @NSManaged public func addToImages(_ values: NSSet)

    @objc(removeImages:)
    @NSManaged public func removeFromImages(_ values: NSSet)

}

extension ProductModel : Identifiable {}

