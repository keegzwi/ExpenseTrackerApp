//Will Keegan & Caden Goodwin
//Final Project iOS App Dev
//HomeView.swift
import SwiftUI

struct HomeView: View {
    @EnvironmentObject var dataManager: DataManager
    @Binding var selectedTab: Int  // This is the binding passed from ContentView

    var body: some View {
        NavigationView {
            List {
                ForEach(dataManager.expenses) { expense in
                    VStack(alignment: .leading) {
                        Text(expense.category)
                            .font(.title)
                            .bold()  // Make the category text bold
                        Text(expense.name)
                            .font(.headline)
                        Text(expense.date, format: .dateTime.day().month().year())
                            .font(.headline)
                            .italic()  // Make the date italic
                        HStack {
                            Spacer()  // Pushes the amount to the right
                            Text("$\(expense.amount, specifier: "%.2f")")
                                .font(.headline)
                        }
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .navigationBarTitle("Expenses")
            .toolbar {
                Button("Add Expense") {
                    selectedTab = 1  // Change to the Add Expense tab when button is clicked
                }
            }
        }
    }

    private func deleteItems(at offsets: IndexSet) {
        dataManager.expenses.remove(atOffsets: offsets)
    }
}

