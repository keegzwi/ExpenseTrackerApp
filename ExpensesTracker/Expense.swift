//Will Keegan & Caden Goodwin
//Final Project iOS App Dev
//Expense.swift
import Foundation

class Expense: Identifiable {
    var id = UUID() // Unique identifier for each expense
    var name: String // Name of the expense
    var amount: Double // Amount of the expense
    var category: String // Category of the expense
    var date: Date // Date of the expense

    init(name: String, amount: Double, category: String, date: Date) {
        self.name = name // Initialize expense name
        self.amount = amount // Initialize expense amount
        self.category = category // Initialize expense category
        self.date = date // Initialize expense date
    }
}

