//
//  OrderView.swift
//  Product
//
//  Created by Nikhil T on 11/06/23.
//

import SwiftUI

struct OrderView: View {
    @State var moveToOrderCompletedView:Bool = false
    @ObservedObject var orderVM:OrderViewViewModel
    var body: some View {
        VStack(alignment:.leading,spacing:Constants.Padding.ls){
            if let orderDetailModel = orderVM.orderDetailModel {
                ProceedToOrderSection(moveToOrderCompletedView: $moveToOrderCompletedView) {
                    Text(Constants.OrderScreen.agreementText)
                        .modifier(LightText())
                        .foregroundColor(Constants.AppColor.primartTextColor)
                }
                .fullScreenCover(isPresented: $moveToOrderCompletedView, onDismiss: {
                    orderVM.removeCartItems()
                }, content: {
                    ViewContainer.createOrderCompletionView()
                })
               
                ScrollView {
                    VStack {
                        AddressSection(address: orderDetailModel.address) {
                        }
                        .modifier(ScreenPadding())
                        .background(Constants.AppColor.white)
                        PriceBreakUpView(priceBreakupList:orderVM.priceModel)
                            .modifier(ScreenPadding())
                    }
                    .modifier(CommonBorder())
                    .modifier(BottomPadding())
                    PaymentSection(payment: orderDetailModel.payment)
                        .modifier(BottomPadding())
                    DeliverySection(delivery: orderDetailModel.delivery)
                        .modifier(BottomPadding())
                    ProceedToOrderSection(moveToOrderCompletedView: $moveToOrderCompletedView) {
                        Text(orderVM.orderDetailModel?.policy ?? "")
                            .multilineTextAlignment(.leading)
                            .modifier(LightText())
                    }
                    Spacer()
                }
            } else {
                EmptyView {
                    Image(systemName: "exclamationmark.arrow.triangle.2.circlepath")
                    .frame(width: Constants.ImageSize.widthIcon,
                           height: Constants.ImageSize.heightIcon)
                } textContent: {
                    Text("Something Went Wrong")
                }
            }
        }
        .onAppear() {
            orderVM.getOrderDetails()
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
        OrderView(orderVM: OrderViewViewModel(useCase: OrderUseCase(order: OrderServiceRepoStub(), dbRepo: DBRepo()), cartItems: []))
    }
}
