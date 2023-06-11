//
//  TextModifiers.swift
//  Product
//
//  Created by Nikhil T on 11/06/23.
//

import Foundation
import SwiftUI

struct RegularText:ViewModifier {
    func body(content:Content)-> some View {
        content
            .font(.system(size: Constants.FontSize.regularSize))
            .fontWeight(.regular)
    }
}

struct LightText:ViewModifier {
    func body(content:Content)-> some View {
        content
            .font(.system(size: Constants.FontSize.lightSize))
            .fontWeight(.light)
    }
}
struct LargeText:ViewModifier {
    func body(content:Content)-> some View {
        content
            .font(.system(size: Constants.FontSize.largeSize))
            .fontWeight(.bold)
    }
}

struct TitleText:ViewModifier {
    func body(content:Content)-> some View {
        content
            .font(.system(size: Constants.FontSize.title))
            .fontWeight(.bold)
    }
}

struct CommonBorder:ViewModifier {
    func body(content:Content)-> some View {
        content
            .overlay {
                RoundedRectangle(cornerRadius: 5)
                    .inset(by: 0.5) // inset value should be same as lineWidth in .stroke
                    .stroke(Constants.AppColor.primaryColor, lineWidth: 0.5)
            }
    }
}

struct BottomPadding:ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.bottom,Constants.Padding.ds)
    }
}
