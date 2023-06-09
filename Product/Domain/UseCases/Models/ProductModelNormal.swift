//
//  Product.swift
//  Product
//
//  Created by Nikhil T on 17/05/23.
//

import Foundation
//struct ProductModel:Codable {
//    let id:String
//    let title:String
//    let description:String
//    let price:Double
//    let discountPercentage:Double
//    var discounterPrice:Double = 0
//    let rating:Rating
//    let stock:Int
//    let isVeg:Bool
//    let brand:String
//    let category:String
//    let images:[String]
//    let exp:String
//    var totalCartCount:Int = 0
//    enum CodingKeys: CodingKey {
//        case id
//        case title
//        case description
//        case price
//        case discountPercentage
//        case rating
//        case stock
//        case isVeg
//        case brand
//        case category
//        case images
//        case exp
//    }
//    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.id = try container.decode(String.self, forKey: .id)
//        self.title = try container.decode(String.self, forKey: .title)
//        self.description = try container.decode(String.self, forKey: .description)
//        self.price = try container.decode(Double.self, forKey: .price)
//        self.discountPercentage = try container.decode(Double.self, forKey: .discountPercentage)
//        self.discounterPrice = price - (price * discountPercentage/100)
//        self.rating = try container.decode(Rating.self, forKey: .rating)
//        self.stock = try container.decode(Int.self, forKey: .stock)
//        self.isVeg = try container.decode(Bool.self, forKey: .isVeg)
//        self.brand = try container.decode(String.self, forKey: .brand)
//        self.category = try container.decode(String.self, forKey: .category)
//        self.images = try container.decode([String].self, forKey: .images)
//        self.exp = try container.decode(String.self, forKey: .exp)
//    }
//}

//struct Rating:Codable {
//    let currentRating:Double
//    let totalRating:Int
//}
//
//extension Rating:Hashable{}
//extension ProductModel:Hashable,Identifiable {}


