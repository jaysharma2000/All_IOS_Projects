//
//  TransactionStore.swift
//  PersonalBudgetTracker
//
//  Created by admin on 28/01/25.
//

import Foundation

struct Transaction: Identifiable{
    let id: UUID
    let amount: Double
    let discription: String
    let category: String
}

class TransactionStore: ObservableObject{
    @Published var transactions: [Transaction] = []
    
    var totalIncome : Double { transactions.filter{ $0.category == "Income" }.reduce(0){$0 + $1.amount}}
    
    var totalExpense: Double{
        transactions.filter{$0.category == "Expense" }.reduce(0){$0 + $1.amount}
    }
    
    var currentBalance: Double{
        totalIncome - totalExpense
    }
    
    func deleteTransaction(index: Int){
        transactions.remove(at: index)
    }
    
    func updateTransaction(_ transaction: Transaction, at index: Int ){
        transactions[index] = transaction
    }
}




