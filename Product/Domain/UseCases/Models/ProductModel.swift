//
//  ProductModel+CoreDataClass.swift
//  Product
//
//  Created by Nikhil T on 08/06/23.
//
//

import Foundation
struct ProductModel: Decodable {
   let brand: String
   let category: String
   let descriptionText: String
   let discounterPrice: Double
   let discountPercentage: Double
   let exp: String
   let id: String
   let isVeg: Bool
   let price: Double
   let stock: Int
   let title: String
   var totalCartCount: Int = 0
   let rating: Rating?
   let images: [String]
    
   init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.descriptionText = try container.decode(String.self, forKey: .descriptionText)
        self.price = try container.decode(Double.self, forKey: .price)
        self.discountPercentage = try container.decode(Double.self, forKey: .discountPercentage)
        self.discounterPrice = price - (price * discountPercentage/100)
        self.rating = try container.decode(Rating.self, forKey: .rating)
        self.stock = try container.decode(Int.self, forKey: .stock)
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

extension ProductModel:Identifiable{}
