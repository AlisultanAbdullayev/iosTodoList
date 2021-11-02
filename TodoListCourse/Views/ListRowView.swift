//
//  ListRowView.swift
//  TodoListCourse
//
//  Created by Alisultan Abdullah on 1.11.2021.
//

import SwiftUI

struct ListRowView: View {
    
    var item: ItemModel
    
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundColor(item.isCompleted ? .green : .gray)
            Text(item.title)
            Spacer()
        }
        .font(.title3)
//        .padding(8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ListRowView(item: ItemModel(title: "This is the first title!", isCompleted: true))
            ListRowView(item: ItemModel(title: "This is the second title!", isCompleted: false))
        }
        .previewLayout(.sizeThatFits)
    }
}
