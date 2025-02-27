//
//  ContentView.swift
//  PersonalBudgetTracker
//
//  Created by admin on 28/01/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var transactionStore: TransactionStore
    
    var body: some View {
        NavigationView{
            VStack(spacing:20) {
                Text("Welcome to Budget Tracker App").font(.headline).padding()
                Text("Current Balance").font(.largeTitle)
                Text("$ \(transactionStore.currentBalance, specifier: "%.2f")").font(.largeTitle).foregroundColor( transactionStore.currentBalance >= 0 ? .green : .red)
                
                Spacer()
                
                NavigationLink(destination: TransactionsListView()){
                    Text("View all Transactions")
                }
            }
            .padding()
        }.navigationTitle("DashBoard")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
