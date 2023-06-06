//
//  TagView.swift
//  Product
//
//  Created by Nikhil T on 25/05/23.
//

import SwiftUI

struct TagView: View {
    let color:Color
    let width:CGFloat
    let height:CGFloat
    
    var body: some View {
        Image(systemName: "tag.fill")
            .resizable()
            .frame(width:width,height:height)
            .foregroundColor(color)
    }
}

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        TagView(color: .green, width: 20, height: 20)
    }
}
