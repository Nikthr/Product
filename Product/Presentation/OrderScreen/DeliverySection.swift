//
//  DeliverySection.swift
//  Product
//
//  Created by Nikhil T on 11/06/23.
//

import SwiftUI

struct DeliverySection: View {
    let delivery:Delivery
    var body: some View {
        VStack(alignment:.leading) {
            HeaderView(title: "Delivery Section")
                .fontWeight(.bold)
                .padding(.bottom,Constants.Padding.s)
                VStack(alignment:.leading){
                    HStack{
                        Image(systemName: "checkmark.diamond.fill")
                            .frame(width: Constants.ImageSize.widthIcon,
                                   height: Constants.ImageSize.heightIcon)
                            .foregroundColor(Constants.AppColor.green)
                        Text(delivery.title)
                            .modifier(RegularText())
                            .foregroundColor(Constants.AppColor.primartTextColor)
                        Spacer()
                    }
                    HStack{
                        Text(Constants.ProductDetailsScreen.expectedDeliveryText)
                            .modifier(RegularText())
                            .foregroundColor(Constants.AppColor.primartTextColor)
                        Text(delivery.expected)
                            .modifier(LargeText())
                            .foregroundColor(Constants.AppColor.primartTextColor)
                    }
                }
                .modifier(ScreenPadding())
                .modifier(CommonBorder())
            
        }
    }
}

struct DeliverySection_Previews: PreviewProvider {
    static var previews: some View {
        DeliverySection(delivery: Delivery(title: "", freeAbove: 2.99, expected: ""))
    }
}
