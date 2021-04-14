//
//  ContentView.swift
//  TodoApp
//
//  Created by Surapunya Thongdee on 26/3/2564 BE.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \TodoCD.name, ascending: false)]) private var todosCD: FetchedResults<TodoCD>
    
//    @EnvironmentObject private var todoList: TodoList
    @State private var showAddTodoView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(todosCD, id: \.self) { todo in
                    NavigationLink(destination: TodoView(todo: todo)
                    ) {
                        HStack {
                            Image(todo.category ?? "")
                                .resizable()
                                .frame(width: 50, height: 50)
                            Text(todo.name ?? "untitled")
                        }
                    }.onLongPressGesture {
                        updateTodo(todo: todo)
                    }
                }
                .onDelete{ indexSet in
                    deleteTodo(offsets: indexSet)
                }
            }
            .navigationTitle("Todo Items")
            .navigationBarItems(
                leading: Button(action: {
                    showAddTodoView.toggle()
                    
                }) {
                    Text("Add")
                }
                .sheet(isPresented: $showAddTodoView) {
                    AddTodoView(showAddTodoView: $showAddTodoView)
                },
                trailing: EditButton())
        }
    }
    private func deleteTodo(offsets: IndexSet) {
        for index in offsets {
            let todo = todosCD[index]
            viewContext.delete(todo)
        }
        do {
            try viewContext.save()
        } catch {
            let error = error as NSError
            fatalError("unresolved error: \(error)")
        }
    }
   
    private func updateTodo(todo: FetchedResults<TodoCD>.Element) {
        todo.name = " 😀 "
        do {
            try viewContext.save()
        } catch {
            let error = error as NSError
            fatalError("unresolved error: \(error)")
        }
    }
}

struct TodoView: View {
    var todo: TodoCD
    
    var body: some View {
        VStack {
            Text(todo.name ?? "untitled")
            Image(todo.category ?? "")
                .resizable()
                .frame(width: 200, height: 200)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(TodoList())
    }
}


