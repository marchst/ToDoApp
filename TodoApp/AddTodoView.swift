//
//  AddTodoView.swift
//  TodoApp
//
//  Created by Surapunya Thongdee on 26/3/2564 BE.
//

import SwiftUI

struct AddTodoView: View {
    @Environment(\.managedObjectContext) private var viewContext
//    @EnvironmentObject private var todoList: TodoList
    @State private var name = ""
    @State private var selectedCategory = 0
    @Binding var showAddTodoView: Bool
    
    private let categoryTypes = ["family","personal","work"]
    
    var body: some View {
        VStack {
            Text("Add Todo").font(.largeTitle)
            TextField("Todo Name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .border(Color.black)
                .padding()
            Text("Select category")
            Picker("", selection: $selectedCategory) {
                ForEach(0..<categoryTypes.count) {
                    Text(categoryTypes[$0])
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Button(action: {
                showAddTodoView = false
                let newTodoCD = TodoCD(context: viewContext)
                newTodoCD.name = name
                newTodoCD.category = categoryTypes[selectedCategory]
                do {
                    try viewContext.save()
                } catch {
                    let error = error as NSError
                    fatalError("unresolved error: \(error)")
                }
                
            }) {
                Text("Done")
            }
        }
        .padding()
    }
}

struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoView(showAddTodoView: .constant(true))
            .environmentObject(TodoList())
    }
}
