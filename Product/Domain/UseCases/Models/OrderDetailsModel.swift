//
//  OrderDetailsModel.swift
//  Product
//
//  Created by Nikhil T on 11/06/23.
//

import Foundation

struct OrderDetailsModel:Decodable {
    
}

struct PriceBreakUpModel:Decodable,Hashable {
    let priceBreakUp:[PriceBreakUp]
    let total:PriceBreakUp
}

struct PriceBreakUp:Decodable,Hashable {
    let title:String
    let price:String
}

extension PriceBreakUp:Identifiable {
    var id: String {
        return title
    }
}
