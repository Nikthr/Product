//
//  Utils.swift
//  Product
//
//  Created by Nikhil T on 16/05/23.
//

import Foundation
import Combine
public func getDataFromBundle(file:String,ext:String) -> AnyPublisher<Data,Error> {
    if let url = Bundle.main.url(forResource: file, withExtension: ext) {
        do {
            let data = try Data(contentsOf: url)
            return Result.Publisher(data).eraseToAnyPublisher()
            
        } catch {
            return Result.Publisher(error).eraseToAnyPublisher()
        }
    }else {
        return Result.Publisher(CustomError.init(error: Errors.badURL)).eraseToAnyPublisher()
    }
}

let currencyFormatter: NumberFormatter = {
  let formatter = NumberFormatter()
  formatter.numberStyle = .currency
  formatter.currencyCode = "USD"
  return formatter
}()
