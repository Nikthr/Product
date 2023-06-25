//
//  OrderView.swift
//  Product
//
//  Created by Nikhil T on 11/06/23.
//

import SwiftUI

struct OrderView: View {
    @State var moveToOrderCompletedView:Bool = false
    var body: some View {
        VStack(alignment:.leading,spacing:Constants.Padding.ls){
            ProceedToOrderSection(moveToOrderCompletedView: $moveToOrderCompletedView) {
                Text(Constants.OrderScreen.agreementText)
                    .modifier(LightText())
                    .foregroundColor(Constants.AppColor.primartTextColor)
            }
            .navigationDestination(isPresented: $moveToOrderCompletedView) {
                Text("Order completed")
            }
            ScrollView {
                VStack {
                    AddressSection(address: Address(type: "tt", name: "ttt", houseno: "ttt", street: "ttt", zipCode: "3333")) {
                        
                    }
                    .modifier(ScreenPadding())
                    .background(Constants.AppColor.white)
                    PriceBreakUpView(priceBreakupList:PriceBreakUpModel(priceBreakUp: [PriceBreakUp(title: "Price", price: "10"),PriceBreakUp(title: "Price1", price: "11")], total: PriceBreakUp(title: "Total", price: "15")))
                        .modifier(ScreenPadding())
                    
                }
                .modifier(CommonBorder())
                .modifier(BottomPadding())
                PaymentSection()
                    .modifier(BottomPadding())
                DeliverySection()
                    .modifier(BottomPadding())
                ProceedToOrderSection(moveToOrderCompletedView: $moveToOrderCompletedView) {
                    Text("Unless otherwise stated in this Change of Mind Return Policy, all items being returned for change of mind must be returned in the same condition in which you received the item. This means that, for change of mind returns: New items must be returned unused, undamaged and unworn; Items sold in Used and Renewed condition must not have any additional signs of use or damage;All items must not be damaged, missing parts or in unsellable condition because of customer negligence, misuse or tampering; All items must not have been resized, damaged or otherwise altered after delivery;Packaging must be unopened and seals intact (where applicable), except for fashion items, which can be opened; see Clothing, Jewellery, Shoes and Watches section; and All packaging and documentation (e.g. boxes, manuals, warranty cards, certificates of authenticity etc.) must be included with the item being returned for change of mind. Amazon AU is not required to accept change of mind returns on items outside the specified return window or change of mind returns of items that do not comply with this Change of Mind Returns Policy.These conditions apply only to change of mind returns and do not apply to items that are returned because they are faulty. Please see our Returning Faulty Items help page for information about returning faulty items and your rights under the Australian Consumer Law")
                        .multilineTextAlignment(.leading)
                        .modifier(LightText())
                }
                Spacer()
            }
            
        }
        .modifier(ScreenPadding())
        .background(Constants.AppColor.backgroundColor)
        .toolbar {
           ToolbarItem(placement: .principal) {
               VStack {
                   Text("Order")
                       .bold()
                       .foregroundColor(.white)
               }
           }
        }
        .toolbarBackground(Constants.AppColor.primaryColor, for:.navigationBar)//To change Navigation Bar Add comma and add after .tabbar- .navigationBar
        .toolbarBackground(.visible, for: .navigationBar)
    }
}


struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
