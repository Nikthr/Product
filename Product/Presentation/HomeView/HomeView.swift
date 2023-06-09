//
//  ContentView.swift
//  Product
//
//  Created by Nikhil T on 03/05/23.
//

import SwiftUI
import CoreData
import UIKit

struct ProductCollectionView:View {
    let columns:[GridItem]
    let products:[ProductModel]
    var body: some View {
        LazyVGrid(columns: columns,spacing: 10) {
        ForEach(products, id: \.id) { product in
            ZStack(alignment:.bottom) {
                Image(product.images?.first ?? "")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width:150,height: 150)
                VStack {
                    HStack {
                        Text(product.title)
                            .modifier(RegularText())
                            .padding(.leading)
                            .foregroundColor(Constants.AppColor.primartTextColor)
                        Spacer()
                    }
                    HStack{
                        Text(currencyFormatter.string(from: (product.price) as NSNumber) ?? "")
                            .fontWeight(.light)
                            .font(.system(size: 14))
                            .foregroundColor(Constants.AppColor.secondaryTextColor)
                            .strikethrough()
                            .padding(.leading)
                        Spacer()
                        Text(currencyFormatter.string(from: (product.discounterPrice) as NSNumber) ?? "")
                            .modifier(RegularText())
                            .foregroundColor(Constants.AppColor.primartTextColor)
                            .padding(.trailing)
                    }
                }
                .background(Constants.AppColor.white)
            }
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .shadow(color:Constants.AppColor.primaryColor,radius: 5)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .inset(by: 0.5) // inset value should be same as lineWidth in .stroke
                    .stroke(Constants.AppColor.primaryColor, lineWidth: 0.5)
            )
        }.padding(.all,10)
     }
    }
}

struct HeaderView:View {
    let text:String
    var isRightButtonVisible:Bool = false
    var body: some View {
        HStack{
            Text(text)
                .font(.title3)
            Spacer()
            if(isRightButtonVisible) {
                NavigationLink {
                    ProductDetailsView(viewModel: ProductDetailsViewModel(prodId: "1"))
                } label: {
                    HStack {
                        Text("View All")
                            .foregroundColor(Constants.AppColor.primaryColor)
                        Image(systemName: "arrow.right")
                            .tint(Constants.AppColor.primaryColor)
                    }
                }
            }
        }.modifier(ScreenPadding())
    }
}

struct OfferView:View {
    let offer:String
    var body: some View {
        ZStack {
            Image("offerBg")
                .resizable()
                .frame(width:80,height:80)
                
            Text(offer)
                .foregroundColor(.white)
                .font(.title3)
                .bold()
        }
    }
}

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()
    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        ScrollView{
            VStack {
                HeaderView(text: "TopRated")
                HorizontalAutoScrollImageView(images: viewModel.topRatedImages)
                HeaderView(text: "Offers")
                HStack {
                    Image("offer")
                        .resizable()
                        .frame(width: 75,height: 75)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .padding(10)
                    Text(viewModel.homeModel?.offers.tag ?? "")
                        .foregroundColor(Constants.AppColor.primaryColor)
                    Spacer()
                    OfferView(offer: viewModel.homeModel?.offers.offer ?? "")
                        .padding(10)
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .inset(by: 0.5) // inset value should be same as lineWidth in .stroke
                        .stroke(Constants.AppColor.primaryColor, lineWidth: 0.5)
                )
                .shadow(color:Constants.AppColor.primaryColor,radius: 5)
                .background(.white)
                HeaderView(text: "Suggested For You",isRightButtonVisible: true)
                   
                if let products = viewModel.homeModel?.recommeded,products.count > 0 {
                   ProductCollectionView(columns: columns, products: products)
            }
                Spacer()
            }
            .padding(10)
            .onAppear{
                viewModel.readData()
            }
        }
        .background(Constants.AppColor.backgroundColor)
    }
}
    

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
