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
                .foregroundColor(Constants.AppColor.primartTextColor)
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

enum StepperCompUpdate {
    case incr
    case decr
}

struct StepperComponentStyle:ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
            configuration.label
            .foregroundColor(Constants.AppColor.primartTextColor)
            .font(.system(size: Constants.FontSize.largeSize))
            .fontWeight(.regular)
            .padding(EdgeInsets(top: Constants.Padding.xs,
                                leading: Constants.Padding.xs,
                                bottom: Constants.Padding.xs,
                                trailing: Constants.Padding.xs))
            .frame(height:Constants.Common.buttonMinHeight)
    }
}

struct StepperComponent: View {
    @Binding var stepperValue:Int
    var stepperValueChange: (Int,StepperCompUpdate) -> Void
    var body: some View {
        HStack {
            Button("+") {
                stepperValue += 1
                stepperValueChange(stepperValue, .incr)
            }
            .buttonStyle(StepperComponentStyle())
            Text(String(stepperValue))
                .font(.system(size: Constants.FontSize.regularSize))
                .foregroundColor(Constants.AppColor.primartTextColor)
            
            Button("-") {
                stepperValue -= 1
                stepperValueChange(stepperValue, .decr)
                
            }
            .buttonStyle(StepperComponentStyle())
        }
    }
}


struct AddItemButton: View {
    @State var currentValue:Int
    var cartValueChange: (Int,StepperCompUpdate) -> Void
    var body: some View {
        HStack{
            if currentValue != 0 {
                StepperComponent(stepperValue: $currentValue, stepperValueChange: cartValueChange)
            }else {
                Button {
                    currentValue += 1
                    cartValueChange(currentValue, .incr)
                } label: {
                    AddItemView()
                }
           }
       }
       .frame(width: 80,height: 30)
       .overlay(
            RoundedRectangle(cornerRadius: Constants.LineThickness.ds)
                .inset(by: Constants.LineThickness.xs) // inset value should be same as lineWidth in .stroke
                .stroke(Constants.AppColor.primartTextColor, lineWidth:Constants.LineThickness.xs)
       )
   }
}

struct AddItemButton_Previews: PreviewProvider {
    static var previews: some View {
        AddItemButton(currentValue: 1, cartValueChange: addedRemovedItem)
    }
    
    
}

func addedRemovedItem(cartCount:Int,update:StepperCompUpdate) {
    print(cartCount)
}
