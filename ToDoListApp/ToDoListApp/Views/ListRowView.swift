//
//  ListRowView.swift
//  ToDoListApp
//
//  Created by Yashin Zahar on 19.05.2023.
//

import SwiftUI

struct ListRowView: View {
    @EnvironmentObject var listViewModels: ListViewModel
    let item: ItemModel
    
    var body: some View {
        HStack {
            Button {
                listViewModels.updateItem(item: item)
            } label: {
                Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                    .foregroundColor(item.isCompleted ? .green : .red )
            }
            Text(item.title)
                .strikethrough(item.isCompleted)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var item1 = ItemModel(title: "Hello", isCompleted: true)
    
    static var previews: some View {
        ListRowView(item: item1)
        
    }
}
