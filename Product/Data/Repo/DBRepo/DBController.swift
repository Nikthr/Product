//
//  DBController.swift
//  Product
//
//  Created by Nikhil T on 07/06/23.
//

import CoreData
import Foundation

extension CodingUserInfoKey {
    static let context = CodingUserInfoKey(rawValue: "context")!
}

extension JSONDecoder {
    convenience init(context: NSManagedObjectContext) {
        self.init()
        self.userInfo[.context] = context
    }
}

struct DBController {
    static let shared = DBController()
    
    var context:NSManagedObjectContext {
        return getContext()
    }
    
    let container = NSPersistentContainer(name: "Product")
    
    private init() {
        container.loadPersistentStores { descr, error in
            if let error {
                print(error)
            }
        }
    }
    
    private func getContext()->NSManagedObjectContext {
        return self.container.viewContext
    }
    
    func save() throws {
        if (self.container.viewContext.hasChanges) {
            try self.container.viewContext.save()
        }
    }
}
