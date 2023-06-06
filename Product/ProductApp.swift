//
//  ProductApp.swift
//  Product
//
//  Created by Nikhil T on 03/05/23.
//

import SwiftUI

@main
struct ProductApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            Container()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
