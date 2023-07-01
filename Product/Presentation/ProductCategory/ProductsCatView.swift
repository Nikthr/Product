//
//  ProductsView.swift
//  Product
//
//  Created by Nikhil T on 18/05/23.
//

import UIKit
import SwiftUI

struct ProductsCatView:View {
    @ObservedObject var viewModel:ProductsCatViewModel
    let gridColoumn = [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]
    var body: some View {
        VStack {
            LazyVGrid(columns: gridColoumn) {
                ForEach(viewModel.categories, id: \.id) {cat in
                    NavigationLink {
                        if let subCat = cat.subCat, subCat.count > 0 {
                            ProductsCatView(viewModel: ProductsCatViewModel(selections: viewModel.getSelectedCatList(id:cat.id), categories: subCat))
                        } else {
                            //ProductList screen
                            ViewContainer.createProdView()
                        }
                    } label: {
                        VStack{
                            Image(cat.image).resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 60,height: 60)
                                .clipShape(RoundedRectangle(cornerRadius: 30))
                            Text(cat.name)
                                .font(.system(size: 14))
                                .fontWeight(.regular)
                                .multilineTextAlignment(.center)
                                .foregroundColor(Constants.AppColor.primartTextColor)
                        }
                    }.padding(10)

                    }
          
                }
            Spacer();
          }
          
         .background(Constants.AppColor.backgroundColor)
         .onAppear{
             if(viewModel.isMainCategory()) {
                 viewModel.getCategories()
             }
          }
//         .navigationDestination(for: CategoryModel.self, destination: { cat in
//             if let subCat = cat.subCat, subCat.count > 0 {
//                 ProductsCatView(viewModel: ProductsCatViewModel(selections: viewModel.getSelectedCatList(id:cat.id), categories: subCat))
//             } else {
//                 //ProductList screen
//             }
//         })

         .toolbar {
             ToolbarItem(placement: .principal) {
                 VStack {
                     Text("Category")
                         .bold()
                         .foregroundColor(.white)
                 }
             }
         }
         .toolbarBackground(Constants.AppColor.primaryColor, for:.navigationBar)//To change Navigation Bar Add comma and add after .tabbar- .navigationBar
         .toolbarBackground(.visible, for: .navigationBar)
    }

}
