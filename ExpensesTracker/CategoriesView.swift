import SwiftUI
//Will Keegan & Caden Goodwin
//Final Project iOS App Dev
//CategoriesView.swift
struct CategoriesView: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var newCategory = ""

    var body: some View {
        NavigationView {
            List {
                ForEach(dataManager.categories, id: \.self) { category in
                    Text(category)
                }
                HStack {
                    TextField("New Category", text: $newCategory)
                    Button(action: {
                        if !newCategory.isEmpty {
                            dataManager.categories.append(newCategory)
                            newCategory = ""
                        }
                    }) {
                        Text("Add")
                    }
                }
            }
            .navigationBarTitle("Categories", displayMode: .automatic)  // Uses default or large, depending on overall navigation style
        }
    }
}

