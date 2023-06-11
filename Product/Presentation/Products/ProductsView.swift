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
                        let _ = print(product)
                        NavigationLink {
                            ProductDetailsView(viewModel: ProductDetailsViewModel(prodId: product.id))
                        } label: {
                            ProductCell(product: product, cartValueChanged: viewModel.cartValueChanged)
                            .modifier(ScreenPadding())
                            .background(Constants.AppColor.white)
                        }
                    }
                }
        }
        .background(Constants.AppColor.backgroundColor)
        .scrollContentBackground(.hidden)
        .padding(.leading,Constants.Padding.noPadding)
        .onAppear{
            viewModel.getProdList(catHeirarchy: [])
        }
    }
    
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
    }
}
