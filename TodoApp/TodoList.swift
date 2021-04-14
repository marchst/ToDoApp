//
//  TodoList.swift
//  TodoApp
//
//  Created by Surapunya Thongdee on 26/3/2564 BE.
//

import Foundation

class TodoList: ObservableObject{
    @Published var todos: [Todo] = [
        Todo(name:" Write book", category: "work"),
        Todo(name: "Read cartoon", category: "personal"),
        Todo(name: "Call wife", category: "family")]
    
    func addTodo(name: String, categoryType: Int) {
        todos.append(Todo(name: name, category: Todo.categoryType[categoryType]))
    }
}
