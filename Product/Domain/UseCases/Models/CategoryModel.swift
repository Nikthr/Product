//
//  HomeModel.swift
//  Product
//
//  Created by Nikhil T on 17/05/23.
//

import Foundation


struct Categories:Decodable {
    let categories:[CategoryModel]
}

struct CategoryModel:Decodable {
    let id:String
    let name:String
    let image:String
    let subCat:[CategoryModel]?
}

extension CategoryModel:Hashable {}
extension Categories:Hashable {}
