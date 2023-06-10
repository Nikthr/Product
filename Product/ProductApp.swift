//
//  ProductApp.swift
//  Product
//
//  Created by Nikhil T on 03/05/23.
//

import SwiftUI

@main
struct ProductApp: App {

    var body: some Scene {
        WindowGroup {
            Container()
                .environment(\.managedObjectContext, DBController.shared.context)
        }
    }
}
