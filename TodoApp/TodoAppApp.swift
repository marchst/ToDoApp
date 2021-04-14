//
//  TodoAppApp.swift
//  TodoApp
//
//  Created by Surapunya Thongdee on 26/3/2564 BE.
//

import SwiftUI

@main
struct TodoAppApp: App {
    let persistentContainer = PersistentController.shared
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(TodoList())
                .environment(\.managedObjectContext,
                    persistentContainer.container.viewContext)
        }
    }
}
