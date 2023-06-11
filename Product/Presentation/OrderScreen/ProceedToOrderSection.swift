//
//  ProceedToOrderSection.swift
//  Product
//
//  Created by Nikhil T on 11/06/23.
//

import SwiftUI

struct ProceedToOrderSection<Content:View>: View {
    @ViewBuilder var textcontent:Content
    var body: some View {
        VStack(alignment:.leading,spacing:Constants.Padding.ls){
            textcontent
            NavigationLink(destination: Text("")) {
                Button{
                }label:{
                    Text(String(format: Constants.OrderScreen.proceedToOrderText))
                        .frame(maxWidth:.infinity)
                        .padding()
                }
                .buttonStyle(PrimaryButtonStyle())
            }
        }
    }
}

struct ProceedToOrderSection_Previews: PreviewProvider {
    static var previews: some View {
        ProceedToOrderSection{ EmptyView()
        }
    }
}
