//
//  CustomButton.swift
//  Product
//
//  Created by Nikhil T on 26/05/23.
import SwiftUI

struct PrimaryButtonStyle:ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .font(.system(size: Constants.FontSize.largeSize))
            .fontWeight(.semibold)
            .padding(EdgeInsets(top: Constants.Padding.xs,
                                leading: Constants.Padding.xs,
                                bottom: Constants.Padding.xs,
                                trailing: Constants.Padding.xs))
            .background(Constants.AppColor.buttonBG)
            .clipShape(RoundedRectangle(cornerRadius: Constants.BorderRaduis.borderRadiusM))
    }
}

