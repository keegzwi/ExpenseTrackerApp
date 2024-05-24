//Will Keegan & Caden Goodwin
//Final Project iOS App Dev
//DataManager
import SwiftUI
import Combine

class DataManager: ObservableObject {
    @Published var expenses: [Expense] = [] // Published array to store expenses
    @Published var categories: [String] = ["Food", "Transport", "Rent", "Utilities", "Entertainment"] // Published array to store categories
    var totalExpense: Double { // Computed property to calculate total expense
        expenses.reduce(0) { $0 + $1.amount } // Sum of all expense amounts
    }

    func categoryColor(_ category: String) -> Color { // Method to get color for a category
        switch category { // Switch statement to determine color based on category
        case "Food": return .green
        case "Transport": return .blue
        case "Rent": return .orange
        case "Utilities": return .red
        case "Entertainment": return .purple
        default: return .gray // Fallback color
        }
    }
}


