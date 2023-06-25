//
//  HomeModel.swift
//  Product
//
//  Created by Nikhil T on 17/05/23.
//

import Foundation
struct HomeModel:Decodable {
    let toprated:[ProductModel]
    let offers:Offer
    let recommeded:[ProductModel]
}

struct Offer:Decodable {
    let tag:String
    let offer:String
}

