//
//  ViewControllerContainer.swift
//  Product
//
//  Created by Nikhil T on 01/07/23.
//

import Foundation

import Foundation

struct ViewContainer {
    static func createHomeView()-> HomeView {
        let viewModel = VMContainer.createHomeViewModel()
        return HomeView(viewModel: viewModel)
    }
    
    static func createCatView()-> ProductsCatView {
        let viewModel = VMContainer.createProdCatViewModel()
        return ProductsCatView(viewModel: viewModel)
    }
    
    static func createCartView()-> CartView {
        let viewModel = VMContainer.createCartViewModel()
        return CartView(viewModel: viewModel)
    }
    
    static func createProdView()-> ProductView {
        let viewModel = VMContainer.createProdViewModel()
        return ProductView(viewModel: viewModel)
    }
    
    static func createProdDetailsView(prod:ProductModel)-> ProductDetailsView {
        let viewModel = VMContainer.createProdDetailsModel(prod: prod)
        return ProductDetailsView(viewModel: viewModel)
    }
    
    static func createOrderScreen(cartItems:[ProductModel])-> OrderView {
        let viewModel = VMContainer.createOrderModel(cartItems:cartItems)
        return OrderView(orderVM:viewModel)
    }
    
    static func createOrderCompletionView()->OrderCompletionView {
        return OrderCompletionView()
    }
}
