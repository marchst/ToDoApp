//
//  Persistence.swift
//  TodoApp
//
//  Created by Surapunya Thongdee on 2/4/2564 BE.
//

import CoreData

struct PersistentController {
    static let shared = PersistentController()
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "Todo")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("unresolved error: \(error)")
            }
        }
    }
}
