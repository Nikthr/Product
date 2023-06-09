//
//  Rating+CoreDataClass.swift
//  Product
//
//  Created by Nikhil T on 08/06/23.
//
//

import Foundation
import CoreData

@objc(Rating)
public class Rating: NSManagedObject,Decodable {
    @NSManaged public var currentRating: Double
    @NSManaged public var totalRating: Int16
    
    public required convenience init(from decoder: Decoder) throws {
        guard let context = decoder.userInfo[.context] as? NSManagedObjectContext,
              let entity = NSEntityDescription.entity(forEntityName: "Rating", in: context) else {
            fatalError("Error: with managed object context!")
        }
        self.init(entity: entity, insertInto: context)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.currentRating = try container.decode(Double.self, forKey: .currentRating)
        self.totalRating = try container.decode(Int16.self, forKey: .totalRating)
    }
    
    enum CodingKeys: String, CodingKey {
            case currentRating
            case totalRating
    }
}
