//
//  HomeRepo.swift
//  Product
//
//  Created by Nikhil T on 03/05/23.
//

import Foundation
import Combine

class ProductCatRepoStub:ProductCatRepoInterface {
    
    func getCategories(jsonName:String,exten:String) -> AnyPublisher<Data,Error> {
        return getDataFromBundle(file: jsonName, ext: exten)
    }
}
