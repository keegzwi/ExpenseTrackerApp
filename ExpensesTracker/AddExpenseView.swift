//Will Keegan & Caden Goodwin
//Final Project iOS App Dev
//AddExpenseView.swift
import SwiftUI

struct AddExpenseView: View {
    @EnvironmentObject var dataManager: DataManager // Accesses the data manager object from the environment
    @Binding var selectedTab: Int // Binding for the selected tab
    @State private var name: String = "" // State variable to store the name of the expense
    @State private var amount: String = "" // State variable to store the amount of the expense
    @State private var category: String = "Food"
    @State private var date: Date = Date()
    @State private var showingConfirmation = false // State variable to control the visibility of the confirmation alert

    var body: some View {
        NavigationView {
            Form { // Form view for organizing input fields
                TextField("Name", text: $name) // Text field for entering the name of the expense
                HStack {
                    Text("$") // Text label
                    TextField("Amount", text: $amount) // Text field for entering the amount of the expense
                        .keyboardType(.decimalPad) // Configures the keyboard type to decimal pad
                }
                Picker("Category", selection: $category) { // Picker for selecting the category of the expense
                    ForEach(dataManager.categories, id: \.self) { category in // Iterates over the categories from the data manager
                        Text(category).tag(category) // Displays each category as a selectable option in the picker
                    }
                }
                DatePicker("Date", selection: $date, displayedComponents: .date) // Date picker for selecting the date of the expense
                Button("Add Expense") { // Button to add the expense
                    addExpense() // Calls the addExpense method when the button is tapped
                }
            }
            .navigationBarTitle("Add Expense") // Sets the navigation bar title
            .alert(isPresented: $showingConfirmation) { // Displays an alert when showingConfirmation is true
                Alert(title: Text("Success"), message: Text("Expense added successfully"), dismissButton: .default(Text("OK")) {
                    selectedTab = 0 // Navigates back to Home tab when OK is pressed
                })
            }
        }
    }

    private func addExpense() {
        guard let amountValue = Double(amount) else { return } // Converts the amount string to a double value
        let newExpense = Expense(name: name, amount: amountValue, category: category, date: date) // Creates a new Expense object
        dataManager.expenses.append(newExpense) // Appends the new expense to the expenses array in the data manager
        showingConfirmation = true // Sets showingConfirmation to true to display the confirmation alert
    }
}


