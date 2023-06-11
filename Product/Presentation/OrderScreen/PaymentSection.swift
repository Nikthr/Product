//
//  PaymenySection.swift
//  Product
//
//  Created by Nikhil T on 11/06/23.
//

import SwiftUI

struct PaymentSection: View {
    var paymentOptionIcons:[String] = ["applepay","gpay","mastercard","visa"]
    var body: some View {
        VStack(alignment:.leading) {
            HeaderView(text: "Payment information")
                .fontWeight(.bold)
                .padding(.bottom,Constants.Padding.s)
            VStack(alignment: .leading) {
                HStack{
                    Text("Payment method")
                        .modifier(LargeText())
                    Image(systemName: "creditcard")
                    Image(systemName: "banknote")
                   Spacer()
                }
                HStack {
                    ForEach(paymentOptionIcons,id:\.self) { image in
                        Image(image)
                            .resizable()
                            .scaledToFit()
                            .frame(height:Constants.ImageSize.heightIcon)

                    }
                    Spacer()
                }
                Text("Selected method Master card Ending 1121")
                    .modifier(LargeText())
                    .foregroundColor(Constants.AppColor.primartTextColor)
            }
            .modifier(ScreenPadding())
            .modifier(CommonBorder())
        }
    }
}

struct PaymenySection_Previews: PreviewProvider {
    static var previews: some View {
        PaymentSection()
    }
}
