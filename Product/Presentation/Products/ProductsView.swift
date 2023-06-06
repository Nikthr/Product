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
                            HStack(alignment:.top) {
                                VStack(alignment: .leading) {
                                    Image(product.images.first ?? "")
                                        .resizable()
                                        .modifier(Constants.ProdListScreen.ProductImageFrame())
                                        .padding(.trailing,Constants.Padding.s)
                                    HStack{
                                        TagView(color: .green,
                                                width: Constants.ImageSize.widthIcon, height: Constants.ImageSize.heightIcon)
                                        Text(Constants.ProdListScreen.offerTag)
                                            .font(.system(size: Constants.FontSize.lightSize))
                                            .foregroundColor(.green)
                                    }.padding(.top)
                                }
                                
                                VStack(alignment: .leading) {
                                    HStack{
                                        Text(product.brand)
                                            .fontWeight(.regular)
                                            .font(.system(size: Constants.Padding.ds))
                                            .foregroundColor(Constants.AppColor.secondaryTextColor)
                                        Spacer()
                                        Circle().fill(product.isVeg ? .green : .red)
                                            .frame(width:Constants.Padding.ds,height: Constants.Padding.ds)
                                    }
                                    .padding(.top,Constants.Padding.s)
                                    Text(product.title)
                                        .fontWeight(.regular)
                                        .font(.system(size:Constants.FontSize.regularSize))
                                        .multilineTextAlignment(.leading)
                                        .foregroundColor(Constants.AppColor.primartTextColor)
                                    HStack {
                                        RatingView(value:.constant(Int(product.rating.currentRating)), totalRating: product.rating.totalRating)
                                            .frame(width:100,height: 30)
                                        Spacer()
                                        Text("EXP.\(product.exp)")
                                            .font(.system(size: Constants.FontSize.ultraLightSize))
                                            .fontWeight(.light)
                                            .foregroundColor(.gray)
                                        
                                    }
                                    HStack {
                                        Text(currencyFormatter.string(from: (product.discounterPrice) as NSNumber) ?? "")
                                            .fontWeight(.regular)
                                            .font(.system(size: Constants.FontSize.regularSize))
                                            .foregroundColor(Constants.AppColor.primartTextColor)
                                        Text(currencyFormatter.string(from: (product.price) as NSNumber) ?? "")
                                            .fontWeight(.light)
                                            .font(.system(size: Constants.FontSize.lightSize))
                                            .foregroundColor(Constants.AppColor.secondaryTextColor)
                                            .strikethrough()
                                        Spacer()
                                        Text(String("\(product.discountPercentage) off"))
                                            .foregroundColor(.white)
                                            .fontWeight(.semibold)
                                            .font(.system(size: Constants.FontSize.lightSize))
                                            .padding(Constants.Padding.xs)
                                            .background(.green)
                                            .clipShape(RoundedRectangle(cornerRadius: Constants.BorderRaduis.borderRadiusM))
                                        
                                    }
                                    HStack {
                                        Spacer()
                                        AddItemButton(currentValue: $viewModel.val)
                                    }
                                    Spacer()
                                }
                            }
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
