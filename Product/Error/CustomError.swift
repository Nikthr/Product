//
//  CustomError.swift
//  Product
//
//  Created by Nikhil T on 16/05/23.
//

import Foundation

struct CustomError:Error {
    //Default value of 99
    let errorCode:Int
    let description:String
    
    init(error:Error,description:String?=nil) {
        switch(error as? Errors) {
        case .badURL:
            errorCode = 100
            self.description = description ?? "Bad URL!"
        default:
            errorCode = 99
            self.description = description ?? "Something Went Wrong"
        }
    }
}

enum Errors:Error {
    case badURL
    case genericError
}
