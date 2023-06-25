//
//  AddressModel.swift
//  Product
//
//  Created by Nikhil T on 25/05/23.
//

import Foundation

struct ProdDetailsModel:Decodable {
    let id:String
    let title:String
    let price:Double
    let discountPercentage:Double
    var discounterPrice:Double = 0
    let rating:Rating
    let stock:Int
    let isVeg:Bool
    let brand:String
    let exp:String
    let mfg:String
    let totalOrder:String
    let offers:[String]
    let address:Address
    let details:String
    let imges:[String]
    let manufacturer:String
    let delivery:String
    let paymentReturnOptions:[String]
    let freedelivery:Int
    let recommeded:[ProductModel]
    
    enum CodingKeys:CodingKey {
        case id
        case title
        case price
        case discountPercentage
        case rating
        case stock
        case isVeg
        case brand
        case exp
        case mfg
        case totalOrder
        case offers
        case address
        case details
        case imges
        case manufacturer
        case delivery
        case paymentReturnOptions
        case freedelivery
        case recommeded
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.price = try container.decode(Double.self, forKey: .price)
        self.discountPercentage = try container.decode(Double.self, forKey: .discountPercentage)
        self.discounterPrice = price - (price * discountPercentage/100)
        self.rating = try container.decode(Rating.self, forKey: .rating)
        self.stock = try container.decode(Int.self, forKey: .stock)
        self.isVeg = try container.decode(Bool.self, forKey: .isVeg)
        self.brand = try container.decode(String.self, forKey: .brand)
        self.exp = try container.decode(String.self, forKey: .exp)
        self.mfg = try container.decode(String.self, forKey: .mfg)
        self.totalOrder = try container.decode(String.self, forKey: .totalOrder)
        self.offers = try container.decode([String].self, forKey: .offers)
        self.address = try container.decode(Address.self, forKey: .address)
        self.details = try container.decode(String.self, forKey: .details)
        self.imges = try container.decode([String].self, forKey: .imges)
        self.manufacturer = try container.decode(String.self, forKey: .manufacturer)
        self.delivery = try container.decode(String.self, forKey: .delivery)
        self.paymentReturnOptions = try container.decode([String].self, forKey: .paymentReturnOptions)
        self.freedelivery = try container.decode(Int.self, forKey: .freedelivery)
        self.recommeded = try container.decode([ProductModel].self, forKey: .recommeded)
    }
}

struct Address:Decodable {
    let type:String
    let name:String
    let houseno:String
    let street:String
    let zipCode:String
    
    
}

extension Address:Identifiable{
    var id: String {
        return zipCode
    }
}

extension ProdDetailsModel:Identifiable{}
