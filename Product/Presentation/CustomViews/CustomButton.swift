//
//  CustomButton.swift
//  Product
//
//  Created by Nikhil T on 26/05/23.
import SwiftUI

struct PrimaryButtonStyle:ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(Constants.AppColor.primartTextColor)
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

struct SecondaryButtonStyle:ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(Constants.AppColor.primartTextColor)
            .font(.system(size: Constants.FontSize.regularSize))
            .fontWeight(.semibold)
            .padding(EdgeInsets(top: Constants.Padding.xs,
                                leading: Constants.Padding.ds,
                                bottom: Constants.Padding.xs,
                                trailing: Constants.Padding.ds))
            .frame(height:Constants.Common.buttonMinHeight)
            .overlay(
                    RoundedRectangle(cornerRadius: Constants.BorderRaduis.borderRadiusM)
                        .stroke(Constants.AppColor.primartTextColor, lineWidth: Constants.LineThickness.xs)
                )
            .shadow(radius: Constants.Padding.s)
    }
}
