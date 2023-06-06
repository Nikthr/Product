//
//  Constants.swift
//  Product
//
//  Created by Nikhil T on 14/05/23.
//

import Foundation
import SwiftUI
struct Constants {
    
    struct ImageSize {
        static let widthIcon:CGFloat = 20
        static let heightIcon:CGFloat = 20
    }
    
    struct Padding {
        static let noPadding:CGFloat = 0
        static let xs:CGFloat = 3
        static let s:CGFloat = 6
        static let ds:CGFloat = 12
        static let ls:CGFloat = 24
        static let leadingView:CGFloat = 15
        static let trailingView:CGFloat = 15
    }
    
    struct FontSize {
        static let title:CGFloat = 20
        static let largeSize:CGFloat = 16
        static let regularSize:CGFloat = 14
        static let lightSize:CGFloat = 12
        static let ultraLightSize:CGFloat = 10
    }
    
    struct BorderRaduis {
        static let borderRadiusS:CGFloat = 2
        static let borderRadiusM:CGFloat = 4
    }
    
    struct LineThickness {
        static let xs:CGFloat = 0.5
        static let s:CGFloat = 1
        static let ds:CGFloat = 2
    }
    
    struct Common {
        static let currencyCode:String = Locale.current.currency?.identifier ?? "USD"
        static let jsonExten = ".json"
    }
    struct SystemImages {
        static let tagFill = "tag.fill"
        static let clock = "clock"
        static let chart = "chart.line.uptrend.xyaxis"
    }
    
    struct AppColor {
        static let primaryColor = Color(hue: 0.505, saturation: 0.344, brightness: 0.721)
        static let backgroundColor = Color(red: 244.0/255.0, green: 254.0/255.0, blue: 254.0/255.0)
        static let primartTextColor = Color(red: 50.0/255.0, green: 113.0/255.0, blue: 144.0/255.0)
        static let secondaryTextColor = Color(red: 120.0/255.0, green: 184.0/255.0, blue: 214.0/255.0)
        static let lightGrey = Color(red: 242.0/255.0, green: 242.0/255.0, blue: 242.0/255.0)
        static let white = Color(red: 247.0/255.0, green: 255.0/255.0, blue: 255.0/255.0)
        static let blue = Color.blue
    }
}

//Screens
extension Constants {
    struct HomeScreen {
        static let jsonName = "HomeScreen"
    }
    struct ProdScreen {
        static let catjsonName = "ProductsCategories"
        static let prodList = "ProdList"
        static let prodDetails = "ProductDetails"
    }
    
    struct ProdListScreen {
        struct ProductImageFrame: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .frame(width: 120,height: 120)
            }
        }
        static let offerTag = "Deals above $500"
    }
    
    struct ProductDetailsScreen {
        static let deliverToText = "Deliver to: "
        static let mrpText = "MRP"
        static let offerText = "off"
        static let freeDeliveryText = "FREE Delivery on orders over"
        static let defaultFreeDeliveryValue:Int = 499
        static let exp = "Expiry Date "
        static let mfg = "Manufactured Date "
        static let orderedText = "+ people ordered this in the past 15 days"
        static let sellerText = "Sold by"
        static let expectedDeliveryText = "Expected Delivery in"
        static let addressText = "Deliver To"
        static let prodDetailsText = "Product Details"
    }
}
