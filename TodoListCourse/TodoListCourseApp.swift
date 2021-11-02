//
//  TodoListCourseApp.swift
//  TodoListCourse
//
//  Created by Alisultan Abdullah on 1.11.2021.
//

import SwiftUI

@main
struct TodoListCourseApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
