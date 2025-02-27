//
//  TransactionsListView.swift
//  PersonalBudgetTracker
//
//  Created by admin on 28/01/25.
//

import SwiftUI
/*
struct TransactionsListView: View {
    @EnvironmentObject var transactionStore: TransactionStore
    var isEditable = false
    var body: some View {
        
        List{
            ForEach(Array(transactionStore.transactions.enumerated()), id: \ .1.id){
                index, transaction in
                HStack{
                    VStack{
                        Text(transaction.discription).font(.headline)
                        Text(transaction.category).font(.subheadline).foregroundColor(transaction.category == "Income" ? .green: .red)
                    }
                    
                    Spacer()
                    
                    Text("$ \(transaction.amount, specifier: "%.2f")").foregroundColor(transaction.category == "Income" ? .green : .red)
                    
                    /*Button(action:{
                        NavigationLink(destination: EditTransactionView(transaction: transaction, transactionIndex: index))
                    }){
                        Text("Edit")
                    }*/
                    NavigationLink(destination: EditTransactionView(transaction: transaction, transactionIndex: index)) {
                        Text("Edit")
                            .foregroundColor(.blue) 
                    }

                    Button(action:{
                        if let index = transactionStore.transactions.firstIndex(where: {$0.id == transaction.id}){
                            transactionStore.deleteTransaction(index: index)
                        }
                    }){
                        Text("Delete")
                    }
                }
            }
            
        }.navigationTitle("Transactions")
            .toolbar{
                NavigationLink(destination: TransactionFormView()){
                    Text("Add")
                }
            }
    }
}

struct TransactionsListView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsListView()
    }
}
*/

/*
Button(action: {
                        if let index = transactionStore.transactions.firstIndex(where: { $0.id == transaction.id }) {
                            transactionStore.deleteTransaction(index: index)
                        }
                    }) {
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                    }
*/


struct TransactionsListView: View {
    @EnvironmentObject var transactionStore: TransactionStore
    var isEditable = false
    
    var body: some View {
        List {
            ForEach(Array(transactionStore.transactions.enumerated()), id: \ .1.id) { index, transaction in
                NavigationLink(destination: TransactionFormView(transactionStore: _transactionStore, transaction: transaction, transactionIndex: index)) {
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text(transaction.discription).font(.headline)
                            Text(transaction.category)
                                .font(.subheadline)
                                .foregroundColor(transaction.category == "Income" ? .green : .red)
                        }
                        
                        Spacer()
                        
                        Text("$ \(transaction.amount, specifier: "%.2f")")
                            .foregroundColor(transaction.category == "Income" ? .green : .red)
                        /*
                         NavigationLink(destination: EditTransactionView(transaction: transaction, transactionIndex: index)) {
                         Text("Edit").foregroundColor(.blue)
                         }*/
                        
                        Button(action: {
                            if let index = transactionStore.transactions.firstIndex(where: { $0.id == transaction.id }) {
                                transactionStore.deleteTransaction(index: index)
                            }
                        }) {
                            Text("Delete").foregroundColor(.red)
                        }
                    }
                }
            }
            .navigationTitle("Transactions")
            .toolbar {
                NavigationLink(destination: TransactionFormView()) {
                    Text("Add")
                }
            }
        }
    }
}
/*
struct TransactionsListView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsListView().environmentObject(TransactionStore()) // Ensure environment object is set
    }
}*/
