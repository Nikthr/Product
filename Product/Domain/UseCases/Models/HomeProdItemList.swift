//
//  ProdItemList.swift
//  Product
//
//  Created by Nikhil T on 11/06/23.
//

import Foundation
struct ProdItem:Decodable,Identifiable {
    let brand: String
    let category: String
    let descriptionText: String
    var discounterPrice: Double = 0
    let discountPercentage: Double
    let exp: String
    let id: String
    let isVeg: Bool
    let price: Double
    let stock: Int
    let title: String
    let rating: ProdRating
    let images: [String]
    
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
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.descriptionText = try container.decode(String.self, forKey: .descriptionText)
        self.price = try container.decode(Double.self, forKey: .price)
        self.discountPercentage = try container.decode(Double.self, forKey: .discountPercentage)
        self.discounterPrice = price - (price * discountPercentage/100)
        self.rating = try container.decode(ProdRating.self, forKey: .rating)
        self.stock = try container.decode(Int.self, forKey: .stock)
        self.isVeg = try container.decode(Bool.self, forKey: .isVeg)
        self.brand = try container.decode(String.self, forKey: .brand)
        self.category = try container.decode(String.self, forKey: .category)
        self.images = try container.decode([String].self, forKey: .images)
        self.exp = try container.decode(String.self, forKey: .exp)
    }
}


struct ProdRating:Decodable {
    let currentRating: Double
    let totalRating: Int
    
    enum CodingKeys: String, CodingKey {
            case currentRating
            case totalRating
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.currentRating = try container.decode(Double.self, forKey: .currentRating)
        self.totalRating = try container.decode(Int.self, forKey: .totalRating)
    }
    
    
}
