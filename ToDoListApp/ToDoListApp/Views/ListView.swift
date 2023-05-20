//
//  ContentView.swift
//  ToDoListApp
//
//  Created by Yashin Zahar on 19.05.2023.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModels: ListViewModel
    
    var body: some View {
        ZStack {
            if listViewModels.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(listViewModels.items) { item in
                        NavigationLink {
                            ChangeView(item: item)
                        } label: {
                            ListRowView(item: item)
                                .onTapGesture {
                                    withAnimation(.linear) {
                                        listViewModels.updateItem(item: item)
                                    }
                                }
                        }
                    }
                    .onDelete(perform: listViewModels.deleteItem)
                    .onMove(perform: listViewModels.moveItem)
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("Заметки")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Добавить", destination: AddView()))
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}
