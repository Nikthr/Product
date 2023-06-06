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
                .padding(EdgeInsets(top:Constants.Padding.xs,
                                    leading:Constants.Padding.xs,
                                    bottom:Constants.Padding.xs,
                                    trailing:Constants.Padding.xs))
        }
        .frame(height:30)
    }
}

struct StepperComponent:ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
            configuration.label
            .foregroundColor(.blue)
            .font(.system(size: Constants.FontSize.largeSize))
            .fontWeight(.regular)
            .padding(EdgeInsets(top: Constants.Padding.xs,
                                leading: Constants.Padding.xs,
                                bottom: Constants.Padding.xs,
                                trailing: Constants.Padding.xs))
            .frame(height:30)
    }
}

struct AddItemButton: View {
    @Binding var currentValue:Int
    var body: some View {
        HStack{
            if currentValue != 0 {
                Button("+") {
                    currentValue += 1
                }
                .buttonStyle(StepperComponent())
                Text(String(currentValue))
                    .font(.system(size: Constants.FontSize.regularSize))
                    .foregroundColor(.blue)
                
                Button("-") {
                    currentValue -= 1
                }
                .buttonStyle(StepperComponent())
            }else {
                Button {
                    currentValue += 1
                } label: {
                    AddItemView()
                }
           }
       }
       .frame(width: 80,height: 30)
       .overlay(
            RoundedRectangle(cornerRadius: Constants.LineThickness.ds)
                .inset(by: Constants.LineThickness.xs) // inset value should be same as lineWidth in .stroke
                .stroke(.blue, lineWidth:Constants.LineThickness.xs)
       )
   }
}

struct AddItemButton_Previews: PreviewProvider {
    static var previews: some View {
        AddItemButton(currentValue: .constant(1))
    }
}
