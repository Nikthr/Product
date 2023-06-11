//
//  PriceBreakUpView.swift
//  Product
//
//  Created by Nikhil T on 11/06/23.
//

import SwiftUI

struct PriceBreakUpView: View {
    let priceBreakupList:PriceBreakUpModel
    var body: some View {
        VStack(spacing:Constants.Padding.ds){
            ForEach(priceBreakupList.priceBreakUp){ priceBreakUp in
                HStack{
                    Text(priceBreakUp.title)
                        .modifier(PriceBreakUpTextModifier())
                    Spacer()
                    Text("$ \(priceBreakUp.price)")
                        .modifier(PriceBreakUpTextModifier())
                }
            }
            HStack{
                Text(priceBreakupList.total.title)
                    .modifier(TitleText())
                    .foregroundColor(Constants.AppColor.primartTextColor)
                Spacer()
                Text("$ \(priceBreakupList.total.price)")
                    .modifier(LargeText())
                    .foregroundColor(Constants.AppColor.green)
            }.padding(.top,Constants.Padding.ds)
                .background(Constants.AppColor.white)
        }
    }
    
}

private struct PriceBreakUpTextModifier:ViewModifier {
    func body(content: Content) -> some View {
        content
            .modifier(RegularText())
            .foregroundColor(Constants.AppColor.secondaryTextColor)
    }
    
}

struct PriceBreakUpView_Previews: PreviewProvider {
    static var previews: some View {
        PriceBreakUpView(priceBreakupList:PriceBreakUpModel(priceBreakUp: [PriceBreakUp(title: "Price", price: "10"),PriceBreakUp(title: "Price1", price: "11")], total: PriceBreakUp(title: "Total", price: "15")) )
    }
}


