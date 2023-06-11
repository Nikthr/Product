//
//  ProceedToCheckoutSection.swift
//  Product
//
//  Created by Nikhil T on 10/06/23.
//

import SwiftUI

struct ProceedToCheckoutSection: View {
    let sum:Int
    let itemsCount:Int
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
            NavigationLink(destination: OrderView()) {
                Button{
                    
                }label:{
                    Text(String(format: "Proceed to check out (%d item)", itemsCount))
                        .frame(maxWidth:.infinity)
                        .padding()
                }
                .buttonStyle(PrimaryButtonStyle())
            }
            
        }

    }
}

struct ProceedToCheckoutSection_Previews: PreviewProvider {
    static var previews: some View {
        ProceedToCheckoutSection(sum: 2, itemsCount: 1)
    }
}
