//
//  ItemModel.swift
//  ToDoListApp
//
//  Created by Yashin Zahar on 19.05.2023.
//

import Foundation

struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
    
    func updateTitle(newTitle: String) -> ItemModel {
        return ItemModel(id: id, title: newTitle, isCompleted: isCompleted)
    }
}
