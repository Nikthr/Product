//
//  OrderDetailsModel.swift
//  Product
//
//  Created by Nikhil T on 11/06/23.
//

import Foundation

struct OrderDetailsModel:Decodable {
    let address:Address
    let payment:Payment
    let delivery:Delivery
    let policy:String
}

struct Delivery:Decodable {
    let title:String
    let freeAbove:Double
    let expected:String
}
struct Payment:Decodable {
    let selected:PaymentType
    let types:[PaymentType]
}

struct PaymentType:Decodable,Identifiable {
    let type:String
    let image:String
    let id:Int
}

