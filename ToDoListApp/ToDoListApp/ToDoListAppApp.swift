//
//  ToDoListAppApp.swift
//  ToDoListApp
//
//  Created by Yashin Zahar on 19.05.2023.
//

import SwiftUI

@main
struct ToDoListAppApp: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
