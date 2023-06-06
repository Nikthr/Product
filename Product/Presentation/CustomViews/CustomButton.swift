//
//  CustomButton.swift
//  Product
//
//  Created by Nikhil T on 26/05/23.
//

import SwiftUI

struct PrimaryButton: View {
    let text:String
    var icon:Image? = nil
    let ibAction:() -> Void
    var body: some View {
        Button(action:ibAction,
               label: {
            HStack{
                if let icon {
                    icon
                }
                Text(text)
                    .font(.system(size: Constants.FontSize.title))
                    .fontWeight(.semibold)
            }
        })
        .padding()
        .foregroundColor(Color.white)
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(text: "Primary", icon: Image(systemName: Constants.SystemImages.clock), ibAction: action)
            .background(Constants.AppColor.primaryColor)
    }
    
    static func action()->Void{
        print("clicked")
    }
}
