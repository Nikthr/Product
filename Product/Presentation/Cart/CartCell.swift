//
//  CartCell.swift
//  Product
//
//  Created by Nikhil T on 09/06/23.
//

import SwiftUI

struct CartCell: View {
    @ObservedObject var carItem: ProductModel
    var body: some View {
        HStack(alignment:.top) {
            VStack(alignment: .leading) {
                Image(carItem.images?.first ?? "")
                    .resizable()
                    .modifier(Constants.ProdListScreen.cartImageFrame())
                    .padding(.trailing,Constants.Padding.s)
                HStack{
                    TagView(color: .green,
                            width: Constants.ImageSize.widthIcon, height: Constants.ImageSize.heightIcon)
                    Text(Constants.ProdListScreen.offerTag)
                        .font(.system(size: Constants.FontSize.lightSize))
                        .foregroundColor(.green)
                }
            }
            VStack(alignment: .leading) {
                HStack{
                    Text(carItem.brand)
                        .fontWeight(.regular)
                        .font(.system(size: Constants.FontSize.regularSize))
                        .foregroundColor(Constants.AppColor.secondaryTextColor)
                    Spacer()
                    Circle().fill(carItem.isVeg ? .green : .red)
                        .frame(width:Constants.Padding.ds,height: Constants.Padding.ds)
                }
                .padding(.top,Constants.Padding.s)
                Text(carItem.title)
                    .fontWeight(.regular)
                    .font(.system(size:Constants.FontSize.largeSize))
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Constants.AppColor.primartTextColor)
                HStack {
                    Text(currencyFormatter.string(from: (carItem.discounterPrice) as NSNumber) ?? "")
                        .fontWeight(.regular)
                        .font(.system(size: Constants.FontSize.largeSize))
                        .foregroundColor(Constants.AppColor.primartTextColor)
                    Text(currencyFormatter.string(from: (carItem.price) as NSNumber) ?? "")
                        .fontWeight(.light)
                        .font(.system(size: Constants.FontSize.lightSize))
                        .foregroundColor(Constants.AppColor.secondaryTextColor)
                        .strikethrough()
                    Spacer()
                    Text(String("\(carItem.discountPercentage) off"))
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .font(.system(size: Constants.FontSize.lightSize))
                        .padding(Constants.Padding.xs)
                        .background(.green)
                        .clipShape(RoundedRectangle(cornerRadius: Constants.BorderRaduis.borderRadiusM))
                }
                Spacer()
                HStack {
                    Spacer()
                    AddItemButton(currentValue: Int(carItem.totalCartCount), cartValueChange: cartValueChange)
                }
            }
        }
    }
    
    func cartValueChange(value:Int) {
        
    }
}

