//
//  ProductDetailsView.swift
//  Product
//
//  Created by Nikhil T on 24/05/23.
//

import SwiftUI

struct Seperator:View {
    let height:CGFloat
    var body: some View {
        Rectangle()
            .frame(height: height)
            .foregroundColor(Constants.AppColor.lightGrey)
    }
}

struct RectangleSeperatorWithOverlay:View {
    let height:CGFloat
    var body: some View {
        Seperator(height: height)
            .overlay(Rectangle().frame(width: nil, height: Constants.LineThickness.xs, alignment: .top).foregroundColor(Constants.AppColor.primaryColor), alignment: .top)
    }
}


struct SimilarProdCollectionView:View {
    let columns:[GridItem]
    let products:[ProductModel]
    var addToCartFromSimilarProds:(_ prod:ProductModel)->Void
    @State var currVal:Int = 0
    var body: some View {
        LazyVGrid(columns: columns,spacing: 10) {
        ForEach(products, id: \.id) { product in
            SimilarProductCell(product: product,addedItemToCart: addToCartFromSimilarProds)
        }
        .modifier(ScreenPadding())
     }
     .toolbar {
        ToolbarItem(placement: .principal) {
            VStack {
                Text("Product Details")
                    .bold()
                    .foregroundColor(.white)
            }
        }
     }
     .toolbarBackground(Constants.AppColor.primaryColor, for:.navigationBar)//To change Navigation Bar Add comma and add after .tabbar- .navigationBar
     .toolbarBackground(.visible, for: .navigationBar)
    }
}

struct ProductDetailsView: View {
    @ObservedObject var viewModel:ProductDetailsViewModel
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        GeometryReader { geo in
            ScrollView
            {
              if let detailsModel = viewModel.detailsModel  {
                VStack(alignment: .leading) {
                    Image("bottomLeft")
                        .resizable()
                        .scaledToFit()
                        .frame(width:geo.size.width * 0.8,
                               height: geo.size.width * 0.8)
                        .frame(width: geo.size.width)
                        .padding(.bottom)
                        .overlay(Rectangle().frame(width: nil, height: 0.5, alignment: .top).foregroundColor(Constants.AppColor.primaryColor), alignment: .bottom)
                    
                    VStack(alignment: .leading) {
                        Text(detailsModel.title)
                            .fontWeight(.regular)
                            .font(.system(size: Constants.FontSize.largeSize))
                            .foregroundColor(Constants.AppColor.primartTextColor)
                            .padding(.bottom,Constants.Padding.ds)
                        VStack(alignment:.leading) {
                            HStack {
                                Text(Constants.ProductDetailsScreen.mrpText)
                                    .modifier(PriceFont())
                                    .foregroundColor(Constants.AppColor.secondaryTextColor)
                                Text(String(detailsModel.price))
                                    .strikethrough()
                                    .modifier(PriceFont())
                                    .foregroundColor(Constants.AppColor.secondaryTextColor)
                                Text(currencyFormatter.string(from:ceil(detailsModel.discounterPrice) as NSNumber) ?? "")
                                    .modifier(PriceFont())
                                    .foregroundColor(Constants.AppColor.primartTextColor)
                                Text(String("\(detailsModel.discountPercentage)% ")+Constants.ProductDetailsScreen.offerText)
                                    .foregroundColor(Constants.AppColor.white)
                                    .fontWeight(.semibold)
                                    .font(.system(size: Constants.FontSize.largeSize))
                                    .modifier(TagModifier(bgColor: .green))
                                Spacer()
                            }
                            Text(Constants.ProductDetailsScreen.freeDeliveryText + String("\(detailsModel.freedelivery)"))
                                .modifier(RegularText())
                                .foregroundColor(Constants.AppColor.primartTextColor)
                                
                        }.padding(.bottom,Constants.Padding.ls)
                        RatingView(value: .constant(Int(detailsModel.rating.currentRating)),
                                   width: 15,
                                   height: 15,
                                   totalRating: Int(detailsModel.rating.totalRating))
                        ProductDetailsText(detailsText: detailsModel.details)

                        Button(action: viewModel.cartValueChanged) {
                            Text(Constants.Common.addtocart)
                                .frame(maxWidth:.infinity)
                                .padding()
                        }
                        .buttonStyle(PrimaryButtonStyle())

                        VStack(alignment: .leading) {
                            HStack {
                                Image(systemName: Constants.SystemImages.clock)
                                    .foregroundColor(Constants.AppColor.primartTextColor)
                                VStack{
                                    Text(Constants.ProductDetailsScreen.exp + (detailsModel.exp ) )
                                        .fontWeight(.semibold)
                                        .foregroundColor(Constants.AppColor.primartTextColor)
                                        .font(.system(size: Constants.FontSize.largeSize))
                                    Text(Constants.ProductDetailsScreen.mfg + (detailsModel.mfg))
                                        .modifier(LightText())
                                        .foregroundColor(Constants.AppColor.secondaryTextColor)
                                }
                                Spacer()
                            }
                            
                        }
                        .padding(Constants.Padding.ds)
                        .background(.white)
                        .border(Constants.AppColor.primaryColor,
                                width: Constants.LineThickness.xs)
                        .shadow(color:Constants.AppColor.primaryColor,radius: 5)
                        .padding(.bottom,Constants.Padding.s)
                        
                    }
                    .modifier(ScreenPadding())
                    RectangleSeperatorWithOverlay(height: Constants.Padding.s)
                    VStack(alignment:.leading) {
                        HStack {
                            Image(systemName: Constants.SystemImages.chart)
                                .foregroundColor(.green)
                            Text(detailsModel.totalOrder + Constants.ProductDetailsScreen.orderedText)
                                .modifier(RegularText())
                                .foregroundColor(Constants.AppColor.primartTextColor)
                        }
                        
                    }
                    .modifier(ScreenPadding())
                    RectangleSeperatorWithOverlay(height: Constants.Padding.s)
                    OfferList(offers: detailsModel.offers)
                    RectangleSeperatorWithOverlay(height: Constants.Padding.s)
                    AddressSection(address: detailsModel.address, function: viewModel.changeAddressSelected)
                        .modifier(ScreenPadding())
                    SoldbySection(detailsModel: detailsModel)
                    Group{
                        HeaderView(title: Constants.HomeScreen.suggested)
                            .modifier(ScreenPadding())
                        SimilarProdCollectionView(columns: self.columns,
                                                  products: detailsModel.recommeded,
                                                  addToCartFromSimilarProds:viewModel.addToCartFromSimilarProds)
                    }
                }
              }
            }
            .onAppear{
                viewModel.getProdDetails()
            }
        }
        .background(Constants.AppColor.backgroundColor)
    }
    
}

extension ProductDetailsView {
    private struct ProductDetailsText:View {
        let detailsText:String
        var body:some View {
            VStack(alignment:.leading){
                Text(Constants.ProductDetailsScreen.prodDetailsText)
                    .font(.system(size:Constants.FontSize.largeSize))
                    .fontWeight(.regular)
                    .foregroundColor(Constants.AppColor.primartTextColor)
                    .padding(EdgeInsets(top: Constants.Padding.ds, leading: Constants.Padding.noPadding, bottom: Constants.Padding.ds, trailing: Constants.Padding.noPadding))
                Text(detailsText)
                    .modifier(LightText())
                    .padding(.bottom,Constants.Padding.ds)
                    .foregroundColor(Constants.AppColor.primartTextColor)
            }
        }
    }
}

//Sold by section
extension ProductDetailsView {
    private struct SoldbySection:View {
        let detailsModel:ProdDetailsModel
        var body:some View {
            RectangleSeperatorWithOverlay(height: Constants.Padding.s)
            VStack(alignment: .leading){
                HStack {
                    Text(Constants.ProductDetailsScreen.sellerText)
                        .modifier(RegularText())
                        .foregroundColor(Constants.AppColor.primartTextColor)
                    Text(detailsModel.manufacturer)
                        .modifier(RegularText())
                        .foregroundColor(Constants.AppColor.blue)
                }
                .padding(.bottom)
                
                Text(Constants.ProductDetailsScreen.expectedDeliveryText)
                    .modifier(RegularText())
                    .foregroundColor(Constants.AppColor.primartTextColor)
                Text(detailsModel.delivery)
                    .fontWeight(.bold)
                    .font(.system(size: Constants.FontSize.largeSize))
                    .foregroundColor(Constants.AppColor.primartTextColor)
                    .padding(.bottom)
                ForEach(detailsModel.paymentReturnOptions, id:\.self) {option in
                    Text("\u{2022}\(option)")
                        .modifier(LightText())
                        .foregroundColor(Constants.AppColor.secondaryTextColor)
                }
            }
            .modifier(ScreenPadding())
            RectangleSeperatorWithOverlay(height: Constants.Padding.s)
        }
    }
}

extension ProductDetailsView {
    struct PriceFont: ViewModifier {
        func body(content: Content) -> some View {
            content
                .font(.system(size: Constants.FontSize.title))
                .fontWeight(.bold)
        }
    }
}

//struct ProductDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductDetailsView(viewModel: ProductDetailsViewModel(prod: <#ProductModel#>))
//    }
//}


//Screen Padding
struct ScreenPadding:ViewModifier {
    func body(content:Content)-> some View {
        content
            .padding(EdgeInsets(top: Constants.Padding.s,
                                leading: Constants.Padding.ds,
                                bottom: Constants.Padding.s,
                                trailing: Constants.Padding.ds))
    }
}

struct TagModifier:ViewModifier {
    let bgColor:Color
    func body(content: Content) -> some View {
        content
            .padding(Constants.Padding.xs)
            .background(bgColor)
            .clipShape(RoundedRectangle(cornerRadius: Constants.BorderRaduis.borderRadiusM))
    }
}

//AddressSection
struct AddressSection:View {
    let address:Address?
    let function:()->Void
    var body:some View {
        if let address {
            HStack{
                VStack(alignment:.leading) {
                    HStack {
                        Text(Constants.ProductDetailsScreen.addressText)
                            .modifier(RegularText())
                            .foregroundColor(Constants.AppColor.primartTextColor)
                        Text(address.name)
                            .modifier(RegularText())
                            .foregroundColor(Constants.AppColor.primartTextColor)
                        Text(address.zipCode)
                            .modifier(RegularText())
                            .foregroundColor(Constants.AppColor.primartTextColor)
                        Text(address.type)
                            .modifier(LightText())
                            .modifier(TagModifier(bgColor: Constants.AppColor.lightGrey))
                    }
                    HStack {
                        Text(address.houseno)
                            .modifier(LightText())
                            .foregroundColor(Constants.AppColor.secondaryTextColor)
                        Text(address.street)
                            .modifier(LightText())
                            .foregroundColor(Constants.AppColor.secondaryTextColor)
                    }
                }
                Spacer()
                Button("Change") {
                    function()
                }
                .foregroundColor(Constants.AppColor.blue)
            }
        } else {
            HStack {
                Spacer()
                Button("Add") {
                    function()
                }
                .foregroundColor(Constants.AppColor.blue)
            }
        }
    }
}

//OfferList
struct OfferList:View {
    let offers:[String]
    var body:some View {
        ForEach(offers, id: \.self) { offer in
            VStack {
                HStack {
                    TagView(color: .green, width: Constants.ImageSize.widthIcon, height: Constants.ImageSize.heightIcon)
                    Text(offer)
                        .modifier(RegularText())
                        .foregroundColor(Constants.AppColor.primartTextColor)
                }
                .padding()
            }
            Seperator(height: Constants.LineThickness.xs)
        }
    }
}


