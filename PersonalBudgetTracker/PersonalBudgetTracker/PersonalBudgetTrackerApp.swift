//
//  PersonalBudgetTrackerApp.swift
//  PersonalBudgetTracker
//
//  Created by admin on 28/01/25.
//

import SwiftUI

@main
struct PersonalBudgetTrackerApp: App {
    @StateObject var transactionStore = TransactionStore()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(transactionStore)
        }
    }
}
