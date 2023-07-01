//
//  OrderCompletionView.swift
//  Product
//
//  Created by Nikhil T on 26/06/23.
//

import SwiftUI

struct OrderCompletionView: View {
    @State var animateView:Bool = false
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var selection: SelectedTab
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                Circle()
                    .frame(width: animateView ? 200 : 0,
                           height:  animateView ? 200 : 0)
                    .foregroundColor(animateView ? Constants.AppColor.primaryColor: Constants.AppColor.backgroundColor)
                    .animation(.spring(response:0.9,dampingFraction: 0.8, blendDuration: 0.5), value: animateView)
                Image(systemName: "checkmark")
                    .resizable()
                    .frame(width: 100,height: 100)
                    .foregroundColor(animateView ?
                                     Constants.AppColor.primartTextColor: Constants.AppColor.backgroundColor )
                    .clipShape(animateView ? Rectangle().offset(x:0,y:0) : Rectangle().offset(x:100,y:-100))
                    .opacity(animateView ? 0.8 : 0.0)
                    .animation(.spring(response:0.9,dampingFraction: 0.8, blendDuration: 0.5), value: animateView)
            }
            VStack(spacing: 0){
                HStack{
                    Spacer()
                    Text("Yay!!")
                        .modifier(TitleText())
                        .foregroundColor(animateView ?
                                         Constants.AppColor.primartTextColor: Constants.AppColor.backgroundColor)
                        .animation(.spring(), value: animateView)
                    Spacer()
                }

                Text("Order has been placed")
                    .modifier(LargeText())
                    .foregroundColor(animateView ?
                                     Constants.AppColor.primartTextColor: Constants.AppColor.backgroundColor)
                    .animation(.spring(), value: animateView)

            }
            .padding(.bottom)
            Button {
                selection.selected = .prod
                dismiss()
            } label: {
                Text("Continue Shopping")
                    .foregroundColor(Constants.AppColor.blue)
            }

          Spacer()
        }
        .background(Constants.AppColor.backgroundColor)
        .onAppear{
            animateView = true
        }
        
    }
}

struct OrderCompletionView_Previews: PreviewProvider {
    static var previews: some View {
        OrderCompletionView()
    }
}
