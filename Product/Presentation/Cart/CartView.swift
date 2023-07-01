//
//  CartView.swift
//  Product
//
//  Created by Nikhil T on 09/06/23.
//

import SwiftUI

struct CartView:View {
    @ObservedObject var viewModel:CartViewModel
    let columns = [GridItem(.flexible())]
    @State var moveToOrderView = false
    var body: some View {
        VStack{
            if(viewModel.cartItems.count > 0) {
                ProceedToCheckoutSection(sum: Int(viewModel.totalPrice),itemsCount:viewModel.cartItems.count, moveToOrderView: $moveToOrderView)
                    .modifier(ScreenPadding())
                    .navigationDestination(isPresented: $moveToOrderView) {
                        ViewContainer.createOrderScreen(cartItems: viewModel.cartItems)
                    }
                ScrollView {
                    LazyVGrid(columns: columns,spacing: Constants.Padding.s) {
                        ForEach(viewModel.cartItems) { item in
                            CartCell(carItem: item, cartValueChanged: viewModel.cartValueChanged)
                                .modifier(ScreenPadding())
                                .background(Constants.AppColor.white)
                        }
                    }
                }
                .background(Constants.AppColor.backgroundColor)
                .scrollContentBackground(.hidden)
            }else {
                Spacer()
                EmptyView {
                    Image(systemName:"cart").resizable()
                    .frame(width: Constants.ImageSize.widthIcon,
                           height: Constants.ImageSize.heightIcon)
                } textContent: {
                    Text("Your cart is Empty")
                }
                Spacer()
            }
        }
        .background(Constants.AppColor.backgroundColor)
        .onAppear{
            viewModel.getCartItems()
        }
    }
}


struct EmptyView<Icon:View,Content:View>:View {
    @ViewBuilder var icon:Icon
    @ViewBuilder var textContent:Content
    var body: some View {
        HStack{
            Spacer()
            icon
                .foregroundColor(Constants.AppColor.secondaryTextColor)
            textContent
                .font(.system(size: Constants.FontSize.largeSize))
                .fontWeight(.light)
                .foregroundColor(Constants.AppColor.secondaryTextColor)
            Spacer()
        }
    }
    
}


struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(viewModel: CartViewModel(cartUseCase: CartUseCase(dbRepo: DBRepo())))
    }
}
