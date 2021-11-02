//
//  AddView.swift
//  TodoListCourse
//
//  Created by Alisultan Abdullah on 1.11.2021.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var listViewModel: ListViewModel
    @State private var textFieldText: String = ""
    @State private var alertTitle: String = ""
    @State private var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30.0) {
                TextField("Type something here...", text: $textFieldText)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(.thickMaterial)
                    .cornerRadius(10)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 5)
                            .fill(Color.accentColor)
                    )
                    .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 5)
                Button {
                    addButtonPressed()
                } label: {
                    Text("Add".uppercased())
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                        .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 5)
                }
                
            }
            .padding()
        }
        .navigationBarTitle("Add an Item ✏️")
        .alert(isPresented: $showAlert) {
            getAlert()
        }
    }
    
    func addButtonPressed() {
        if textIsValid() {
            listViewModel.addItem(title: textFieldText)
            dismiss()
        } else {
            
        }
    }
    
    func textIsValid() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new todo item must be at least 3 characters long! 😈"
            showAlert.toggle()
            return false
        } else {
            return true
        }
    }
    
    func getAlert() -> Alert {
        Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
