//
//  ChangeView.swift
//  ToDoListApp
//
//  Created by Yashin Zahar on 19.05.2023.
//

import SwiftUI

struct ChangeView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    let item: ItemModel
    @State var textFieldText: String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Введите текст ...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                Button {
                    saveButtonPressed()
                } label: {
                    Text("Сохранить")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }
            }
            .padding(14)
        }
        .onAppear {
            textTextFiler()
        }
        .navigationTitle("Изменить заметку")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.changeItem(item: item, title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Длина вашей заметки должна быть не менее 3 символов."
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
    
    func textTextFiler() {
        textFieldText = item.title
    }
}

struct ChangeView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeView(item: ItemModel(title: "hellow", isCompleted: true))
    }
}
