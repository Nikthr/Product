//
//  AddItemButton.swift
//  Product
//
//  Created by Nikhil T on 22/05/23.
//

import SwiftUI

struct AddItemView:View {
    var body: some View {
        HStack {
            Text("Add Item")
                .foregroundColor(.blue)
                .font(.system(size: Constants.FontSize.regularSize))
                .fontWeight(.regular)
                .padding(EdgeInsets(top:Constants.Padding.s,
                                    leading:Constants.Padding.s,
                                    bottom:Constants.Padding.s,
                                    trailing:Constants.Padding.s))
        }
        .frame(height:44)
        .overlay(
            RoundedRectangle(cornerRadius: Constants.LineThickness.ds)
                .inset(by: Constants.LineThickness.xs) // inset value should be same as lineWidth in .stroke
                .stroke(.blue, lineWidth:Constants.LineThickness.xs)
        )
    }
}

struct StepperComponent:ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
            configuration.label
            .foregroundColor(.blue)
            .font(.system(size: Constants.FontSize.largeSize))
            .fontWeight(.regular)
            .padding(EdgeInsets(top: Constants.Padding.s,
                                leading: Constants.Padding.ds,
                                bottom: Constants.Padding.s,
                                trailing: Constants.Padding.ds))
    }
}

struct AddItemButton: View {
    @Binding var currentValue:Int
    var body: some View {
        if currentValue != 0 {
            HStack{
                Button("+") {
                    currentValue += 1
                }
                .buttonStyle(StepperComponent())
                Text(String(currentValue))
                    .font(.system(size: Constants.FontSize.regularSize))
                    .foregroundColor(.blue)
                
                Button("-") {
                    currentValue += 1
                }
                .buttonStyle(StepperComponent())
            }
        }else {
            Button {
                currentValue += 1
            } label: {
                AddItemView()
            }
        }
    }
}

struct AddItemButton_Previews: PreviewProvider {
    static var previews: some View {
        AddItemButton(currentValue: .constant(1))
    }
}
