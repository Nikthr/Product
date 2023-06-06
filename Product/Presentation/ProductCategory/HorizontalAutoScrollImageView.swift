//
//  HorizontalAutoScrollImageView.swift
//  Product
//
//  Created by Nikhil T on 15/05/23.
//

import SwiftUI

struct HorizontalAutoScrollImageView: View {
    var images:[String]
    var body: some View {
        TabView {
            ForEach(images, id: \.self) { image in
                ZStack {
                   Constants.AppColor.backgroundColor
                   Image(image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
            }
            }
            .frame(width: UIScreen.main.bounds.width - 20, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
            .tabViewStyle(PageTabViewStyle())
    }
}

struct HorizontalAutoScrollImageView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalAutoScrollImageView(images: ["bottomLeft"])
    }
}
