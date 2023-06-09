//
//  ProductModel+CoreDataClass.swift
//  Product
//
//  Created by Nikhil T on 08/06/23.
//
//

import Foundation
import CoreData

@objc(ProductModel)
public class ProductModel: NSManagedObject,Decodable {
    @NSManaged public var brand: String
    @NSManaged public var category: String
    @NSManaged public var descriptionText: String
    @NSManaged public var discounterPrice: Double
    @NSManaged public var discountPercentage: Double
    @NSManaged public var exp: String
    @NSManaged public var id: String
    @NSManaged public var isVeg: Bool
    @NSManaged public var price: Double
    @NSManaged public var stock: Int16
    @NSManaged public var title: String
    @NSManaged public var totalCartCount: Int16
    @NSManaged public var rating: Rating?
    @NSManaged public var images: [String]?
    
    public required convenience init(from decoder: Decoder) throws {
        guard let context = decoder.userInfo[.context] as? NSManagedObjectContext,
              let entity = NSEntityDescription.entity(forEntityName: "ProductModel", in: context) else {
            fatalError("Error: with managed object context!")
        }
        self.init(entity: entity, insertInto: context)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.descriptionText = try container.decode(String.self, forKey: .descriptionText)
        self.price = try container.decode(Double.self, forKey: .price)
        self.discountPercentage = try container.decode(Double.self, forKey: .discountPercentage)
        self.discounterPrice = price - (price * discountPercentage/100)
        self.rating = try container.decode(Rating.self, forKey: .rating)
        self.stock = try container.decode(Int16.self, forKey: .stock)
        self.isVeg = try container.decode(Bool.self, forKey: .isVeg)
        self.brand = try container.decode(String.self, forKey: .brand)
        self.category = try container.decode(String.self, forKey: .category)
        self.images = try container.decode([String].self, forKey: .images) 
        self.exp = try container.decode(String.self, forKey: .exp)
    }
    
    enum CodingKeys: String, CodingKey {
            case id
            case title
            case descriptionText = "description"
            case price
            case discountPercentage
            case stock
            case isVeg
            case brand
            case category
            case exp
            case rating
            case images
    }
}
