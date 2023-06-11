//
//  CartView.swift
//  Product
//
//  Created by Nikhil T on 09/06/23.
//

import SwiftUI

struct CartView:View {
    var viewModel:CartViewModel
    @FetchRequest(sortDescriptors:[],predicate: NSPredicate(format:  "totalCartCount > 0")) var cartItems:FetchedResults<ProductModel>
    let columns = [GridItem(.flexible())]
    
    private var sum: Double {
        cartItems.reduce(0) { $0 + $1.discounterPrice }
    }
    var body: some View {
        if(cartItems.count > 0) {
            ProceedToCheckoutSection(sum: Int(sum),itemsCount:cartItems.count)
                .modifier(ScreenPadding())
            ScrollView {
                LazyVGrid(columns: columns,spacing: Constants.Padding.s) {
                    ForEach(cartItems) { item in
                        CartCell(carItem: item)
                            .modifier(ScreenPadding())
                            .background(Constants.AppColor.white)
                    }
                }
            }
            .background(Constants.AppColor.backgroundColor)
            .scrollContentBackground(.hidden)
        }else {
            EmptyCartView()
        }
    }
    
}


struct EmptyCartView:View {
    var body: some View {
        VStack {
            HStack{
                Image(systemName:"cart").resizable()
                    .frame(width: Constants.ImageSize.widthIcon,
                           height: Constants.ImageSize.heightIcon)
                    .foregroundColor(Constants.AppColor.secondaryTextColor)
                Text("Your cart is empty")
                    .font(.system(size: Constants.FontSize.largeSize))
                    .fontWeight(.light)
                    .foregroundColor(Constants.AppColor.secondaryTextColor)
            }
        }
    }
}


struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(viewModel: CartViewModel())
    }
}
