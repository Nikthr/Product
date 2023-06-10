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
        VStack(alignment:.leading) {
            HStack{
                Text("Subtotal")
                    .fontWeight(.semibold)
                    .font(.system(size: Constants.FontSize.title))
                Text(String("$\(sum)"))
                    .fontWeight(.semibold)
                    .font(.system(size: Constants.FontSize.largeSize))
            }
            HStack{
                Image(systemName: "checkmark.diamond.fill")
                    .frame(width: Constants.ImageSize.widthIcon,
                           height: Constants.ImageSize.heightIcon)
                    .foregroundColor(Constants.AppColor.green)
                Text("Free delivery")
            }
            Button{
                Text("Order screen")
            }label:{
                Text(String(format: "Proceed to check out (%d item)", cartItems.count))
                    .frame(maxWidth:.infinity)
                    .padding()
            }
            .buttonStyle(PrimaryButtonStyle())
        }.modifier(ScreenPadding())
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
    }
    
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(viewModel: CartViewModel())
    }
}
