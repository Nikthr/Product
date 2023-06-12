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
    //Fetch Request is not the best option for MVVM, we need to go with NSFetchRequest if want to keep pure MVVM approach
    //Still going with this approach(To make DB inserting and deleting very easy) in this view and Cart.
    //If you are doing a e-commerce app, we won't be saving anything in DB anyway. Go with a shared DB controller that can manage the DB fetching and saving from Repo. Already that class is added in this project.
    //Added one more branch() with the right apporach.
    @FetchRequest(sortDescriptors:[],predicate:nil) private var products:FetchedResults<ProductModel>
    @Environment(\.managedObjectContext) private var managedObjectContext

    let columns = [GridItem(.flexible())]
    var body: some View {
            ScrollView {
                LazyVGrid(columns: columns,spacing: Constants.Padding.s) {
                    ForEach(products) { product in
                        NavigationLink {
                            ProductDetailsView(viewModel: ProductDetailsViewModel(prodId: product.id))
                        } label: {
                            ProductCell(product: product, cartValueChanged: cartValueChanged)
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
            if(products.isEmpty) {
                viewModel.getProdList(catHeirarchy: [])
            }
        }
    }
    
}

//Cart value changed
extension ProductView {
    func cartValueChanged(for prod:ProductModel) {
        try? managedObjectContext.save()
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
    }
}
