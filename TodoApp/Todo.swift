//
//  Todo.swift
//  TodoApp
//
//  Created by Surapunya Thongdee on 26/3/2564 BE.
//

import Foundation

struct Todo: Identifiable{
    let id = UUID()
    let name: String
    let category: String
    
    static let categoryType = ["family","personal","work"]
}
