//
//  ProceedToOrderSection.swift
//  Product
//
//  Created by Nikhil T on 11/06/23.
//

import SwiftUI

struct ProceedToOrderSection<Content:View>: View {
    @Binding var moveToOrderCompletedView:Bool
    @ViewBuilder var textcontent:Content
    var body: some View {
        VStack(alignment:.leading,spacing:Constants.Padding.ls){
            textcontent
            Button{
                moveToOrderCompletedView = true
            }label:{
                Text(String(format: Constants.OrderScreen.proceedToOrderText))
                    .frame(maxWidth:.infinity)
                    .padding()
            }
            .buttonStyle(PrimaryButtonStyle())
        }
    }
}

struct ProceedToOrderSection_Previews: PreviewProvider {
    static var previews: some View {
        ProceedToOrderSection(moveToOrderCompletedView: .constant(true)){ EmptyView()
        }
    }
}
