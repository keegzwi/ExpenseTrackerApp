//Will Keegan & Caden Goodwin
//Final Project iOS App Dev
//StatisticsView.swift
import SwiftUI
import Charts

struct StatisticsView: View {
    @EnvironmentObject var dataManager: DataManager
    
    var body: some View {
        NavigationView {
            VStack {
                // Check if there are expenses to display
                if dataManager.expenses.isEmpty {
                    Text("No Statistics")
                        .padding() // Adds padding for better spacing
                        .font(.title) // Makes the text prominent
                } else {
                    VStack {
                        HStack {
                            Spacer() // To center the pie chart

                            // Display Pie Chart if there are expenses
                            //Library from: https://developer.apple.com/documentation/charts
                            if #available(iOS 17.0, *) {
                                Chart(dataManager.expenses) { expense in
                                    SectorMark(
                                        angle: .value("Amount", expense.amount / (dataManager.expenses.reduce(0) { $0 + $1.amount })),
                                        outerRadius: .ratio(1.0) // True pie chart
                                    )
                                    .foregroundStyle(dataManager.categoryColor(expense.category))
                                }
                                .frame(width: 250, height: 250) // Frame size for the pie chart
                                .padding() // Padding for spacing
                            } else {
                                // Fallback on earlier versions
                                Text("Upgrade to iOS 17 to see the chart")
                                    .padding()
                            }

                            Spacer() // To keep the chart centered
                        }
                        
                        // Key/Legend
                        ScrollView {
                            VStack(alignment: .leading, spacing: 10) {
                                let uniqueCategories = Set(dataManager.expenses.map { $0.category })
                                let totalAmount = dataManager.expenses.reduce(0) { $0 + $1.amount }
                                
                                ForEach(Array(uniqueCategories), id: \.self) { category in
                                    let categoryExpenses = dataManager.expenses.filter { $0.category == category }
                                    let totalCategoryAmount = categoryExpenses.reduce(0) { $0 + $1.amount }
                                    let percentage = totalCategoryAmount / totalAmount * 100 // Calculate the percentage
                                    
                                    HStack {
                                        Rectangle() // Color box
                                            .fill(dataManager.categoryColor(category))
                                            .frame(width: 20, height: 20)

                                        Text("\(category) - \(String(format: "%.1f", percentage))%") // Category name with percentage
                                            .font(.headline) // Ensure readability
                                            
                                    }
                                }
                            }
                            .frame(width: 150) // Consistent width to avoid overflow
                            .padding() // Ensure proper spacing
                        }
                    }
                }
            }
            .navigationBarTitle("Statistics", displayMode: .automatic)  // Ensures the title is displayed similarly
            .padding() // Overall padding for the view
        }
    }
}

