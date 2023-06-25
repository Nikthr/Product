//
//  SimilarProductCell.swift
//  Product
//
//  Created by Nikhil T on 25/06/23.
//

import SwiftUI

struct SimilarProductCell: View {
    @State var product:ProductModel
    var addedItemToCart:(_ prod:ProductModel)->Void
    var body: some View {
        VStack {
            Image(product.images.first ?? "")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width:150,height: 150)
            VStack {
                HStack {
                    Text(product.title)
                        .fontWeight(.light)
                        .font(.system(size: 14))
                        .padding(.leading)
                        .foregroundColor(Constants.AppColor.primartTextColor)
                    Spacer()
                }
                HStack{
                    Text(currencyFormatter.string(from: (product.price) as NSNumber) ?? "")
                        .fontWeight(.light)
                        .font(.system(size: 14))
                        .strikethrough()
                        .foregroundColor(Constants.AppColor.secondaryTextColor)
                        .padding(.leading)
                    Spacer()
                    Text(currencyFormatter.string(from: (product.discounterPrice) as NSNumber) ?? "")
                        .fontWeight(.light)
                        .font(.system(size: 14))
                        .padding(.trailing)
                        .foregroundColor(Constants.AppColor.primartTextColor)
                }
            }
            HStack {
                Spacer()
                Button(Constants.Common.addtocart, action: cartValueChanged)
                    .buttonStyle(PrimaryButtonStyle())
                    .padding(Constants.Padding.s)
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 5))
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .inset(by: 0.5) // inset value should be same as lineWidth in .stroke
                .stroke(Constants.AppColor.primaryColor, lineWidth: 0.5)
        )
        .background(Constants.AppColor.white)
    }
    
    func cartValueChanged() {
        addedItemToCart(product)
    }
    
}


