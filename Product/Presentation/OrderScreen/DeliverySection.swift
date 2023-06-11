//
//  DeliverySection.swift
//  Product
//
//  Created by Nikhil T on 11/06/23.
//

import SwiftUI

struct DeliverySection: View {
    var body: some View {
        VStack(alignment:.leading) {
            HeaderView(text: "Delivery Section")
                .fontWeight(.bold)
                .padding(.bottom,Constants.Padding.s)
            VStack(alignment:.leading){
                HStack{
                    Image(systemName: "checkmark.diamond.fill")
                        .frame(width: Constants.ImageSize.widthIcon,
                               height: Constants.ImageSize.heightIcon)
                        .foregroundColor(Constants.AppColor.green)
                    Text("Free delivery")
                        .modifier(RegularText())
                        .foregroundColor(Constants.AppColor.primartTextColor)
                    Spacer()
                }
                Text(Constants.ProductDetailsScreen.expectedDeliveryText)
                    .modifier(RegularText())
                    .foregroundColor(Constants.AppColor.primartTextColor)
            }
            .modifier(ScreenPadding())
            .modifier(CommonBorder())
        }
    }
}

struct DeliverySection_Previews: PreviewProvider {
    static var previews: some View {
        DeliverySection()
    }
}
