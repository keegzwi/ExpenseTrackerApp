//Will Keegan & Caden Goodwin
//Final Project iOS App Dev
//ContentView
import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0  // Manages the selected tab

    var body: some View {
        TabView(selection: $selectedTab) { // Creates a tab view with the selectedTab binding
            HomeView(selectedTab: $selectedTab) // Home tab
                .tabItem {
                    Label("Home", systemImage: "house") // Tab label and icon
                }
                .tag(0) // Tag to identify the tab

            AddExpenseView(selectedTab: $selectedTab) // Add Expense tab
                .tabItem {
                    Label("Add Expense", systemImage: "plus.circle") // Tab label and icon
                }
                .tag(1) // Tag to identify the tab

            CategoriesView() // Categories tab
                .tabItem {
                    Label("Categories", systemImage: "tag") // Tab label and icon
                }
                .tag(2)

            StatisticsView() // Statistics tab
                .tabItem {
                    Label("Statistics", systemImage: "chart.bar") // Tab label and icon
                }
                .tag(3)
        }
    }
}

