//Will Keegan & Caden Goodwin
//Final Project iOS App Dev
//ExpensesTrackerApp.swift

import SwiftUI

@main
struct ExpensesTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(DataManager())  // Attaching DataManager as an environment object
        }
    }
}

