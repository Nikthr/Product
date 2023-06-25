//
//  ProductsView.swift
//  Product
//
//  Created by Nikhil T on 18/05/23.
//

import UIKit
import SwiftUI

struct ProductView:View {
    @ObservedObject var viewModel = ProductsViewModel()
    let columns = [GridItem(.flexible())]
    var body: some View {
            ScrollView {
                LazyVGrid(columns: columns,spacing: Constants.Padding.s) {
                    ForEach(viewModel.products) { product in
                        NavigationLink {
                            ProductDetailsView(viewModel: ProductDetailsViewModel(prodId: product.id))
                        } label: {
                            ProductCell(product: product, cartValueChanged: viewModel.cartValueChanged)
                            .modifier(ScreenPadding())
                            .background(Constants.AppColor.white)
                        }
                    }
                }
                .padding(.top)
        }
        .background(Constants.AppColor.backgroundColor)
        .scrollContentBackground(.hidden)
        .padding(.leading,Constants.Padding.noPadding)
        .onAppear{
            if(viewModel.products.isEmpty) {
                viewModel.getProdList(catHeirarchy: [])
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                VStack {
                    Text("Products")
                        .bold()
                        .foregroundColor(.white)
                }
            }
        }
        .toolbarBackground(Constants.AppColor.primaryColor, for:.navigationBar)//To change Navigation Bar Add comma and add after .tabbar- .navigationBar
        .toolbarBackground(.visible, for: .navigationBar)
        
    }
    
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
    }
}
