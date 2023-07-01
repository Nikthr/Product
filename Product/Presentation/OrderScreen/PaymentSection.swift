//
//  PaymenySection.swift
//  Product
//
//  Created by Nikhil T on 11/06/23.
//

import SwiftUI

struct PaymentSection: View {
    var payment:Payment
    var body: some View {
        VStack(alignment:.leading) {
            HeaderView(title: "Payment information")
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
                    ForEach(payment.types) { type in
                        Image(type.image)
                            .resizable()
                            .scaledToFit()
                            .frame(height:Constants.ImageSize.heightIcon)

                    }
                    Spacer()
                }
                Text("Selected \(payment.selected.type)")
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
        PaymentSection(payment: Payment(selected: PaymentType(type: "", image: "", id: 1), types: []))
    }
}
