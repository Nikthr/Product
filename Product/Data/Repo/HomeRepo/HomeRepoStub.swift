//
//  HomeRepo.swift
//  Product
//
//  Created by Nikhil T on 03/05/23.
//

import Foundation
import Combine

class HomeRepoStubs:HomeRepoInterface {
    
    func getDishes(jsonName:String,exten:String) -> AnyPublisher<Data,Error> {
        return getDataFromBundle(file: jsonName, ext: exten)
    }
}
