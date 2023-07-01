//
//  VMContainer.swift
//  MyMoviez
//
//  Created by Nikhil T on 31/05/23.
//

import Foundation
struct VMContainer {
    static func createHomeViewModel()-> HomeViewModel {
        return HomeViewModel(useCase:UseCaseContainer.homeUseCase())
    }
    
    static func createProdCatViewModel()-> ProductsCatViewModel {
        return ProductsCatViewModel(useCase: UseCaseContainer.catUseCase())
    }
    
    static func createCartViewModel()-> CartViewModel {
        return CartViewModel(cartUseCase: UseCaseContainer.cartUseCase())
    }
    
    static func createProdViewModel()->ProductsViewModel {
        return ProductsViewModel(useCase: UseCaseContainer.prodUseCase())
    }
    
    static func createProdDetailsModel(prod:ProductModel)->ProductDetailsViewModel {
        return ProductDetailsViewModel(prod: prod, useCase: UseCaseContainer.prodDetailsUseCase())
    }
    
    static func createOrderModel(cartItems:[ProductModel])->OrderViewViewModel {
        return OrderViewViewModel(useCase: UseCaseContainer.orderUseCase(), cartItems: cartItems)
    }
    
}

struct UseCaseContainer {
    static func homeUseCase() -> HomeUseCaseInterface {
        HomeUseCase(homeRepo: RepoContainer.createHomeServiceRepo())
    }
    
    static func catUseCase() -> ProductCatUseCaseInterface {
        ProductCatUseCase(productRepo: RepoContainer.createProdCatServiceRepo())
    }
    
    static func cartUseCase() -> CartUseCaseInterface {
        CartUseCase(dbRepo: DBRepoContainer.createDBRepo())
    }
    
    static func prodUseCase() -> ProdListUseCaseInterface {
        ProdListUseCase(productRepo: RepoContainer.createProdServiceRepo(), dbRepo: DBRepoContainer.createDBRepo())
    }
    
    static func prodDetailsUseCase() -> ProdDetailsUseCaseInterface {
        ProdDetailsUseCase(productRepo: RepoContainer.createProdDetailsServiceRepo(), dbRepo: DBRepoContainer.createDBRepo())
    }
    
    static func orderUseCase() -> OrderUseCase {
        OrderUseCase(order: RepoContainer.orderServiceRepo(), dbRepo: DBRepoContainer.createDBRepo())
    }
   
}

struct DBRepoContainer {
    static func createDBRepo() -> DBRepoInterface{
        return DBRepo()
    }
}

struct RepoContainer {
    static func createHomeServiceRepo() -> HomeRepoInterface{
        return HomeRepoStubs()
    }
    static func createProdCatServiceRepo() -> ProductCatRepoInterface{
        return ProductCatRepoStub()
    }
    static func createProdServiceRepo() -> ProdListRepoInterface{
        return ProdListRepoStub()
    }
    static func createProdDetailsServiceRepo() -> ProdDetailsRepoInterface{
        return ProdDetailsRepoStub()
    }
    static func orderServiceRepo() -> OrderServiceRepoInterface{
        return OrderServiceRepoStub()
    }
}

