//
//  HomeUseCase.swift
//  Product
//
//  Created by Nikhil T on 03/05/23.
//



import Foundation
import Combine
class HomeUseCase:HomeUseCaseInterface {
    let homeRepo:HomeRepoInterface
    
    init(homeRepo: HomeRepoInterface) {
        self.homeRepo = homeRepo
    }
    
    func getHomePageData(zipCode:Int?) -> AnyPublisher<HomeModel,Error> {
        homeRepo.getDishes(jsonName: Constants.HomeScreen.jsonName,
                           exten: Constants.Common.jsonExten)
        .decode(type: HomeModel.self, decoder: JSONDecoder())
        .eraseToAnyPublisher()
    }
}
