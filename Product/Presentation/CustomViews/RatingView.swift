//
//  RatingView.swift
//  Product
//
//  Created by Nikhil T on 22/05/23.
//

import SwiftUI

struct RatingView: View {
    @Binding var value:Int
    var width:CGFloat = 10
    var height:CGFloat = 10

    var totalRating:Int
    var title:String = ""
    var maxRating = 5
    var star:Image = Image(systemName: "star.fill")
        .resizable()
    
    var body: some View {
        VStack {
            if(!title.isEmpty) {
                HStack{
                    Text(title)
                            .font(.system(size: Constants.FontSize.ultraLightSize))
                    Spacer()
                }
            }
            HStack(spacing: Constants.Padding.s) {
                HStack(spacing: 0) {
                    ForEach(1..<maxRating + 1, id:\.self){ rateValue in
                        star
                            .frame(width:width,height: height)
                            .aspectRatio(contentMode: .fill)
                            .foregroundColor(rateValue > value ? .gray : .yellow)
                            .onTapGesture {
                                value = rateValue
                            }
                    }
                }
                Text("(\(String(totalRating)))")
                    .fontWeight(.light)
                    .font(.system(size: height))
                    .foregroundColor(.gray)
                Spacer()
            }
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(value: .constant(5), totalRating: 10)
    }
}
