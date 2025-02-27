//
//  TransactionFormView.swift
//  PersonalBudgetTracker
//
//  Created by admin on 28/01/25.
//

import SwiftUI

struct TransactionFormView: View {
    @EnvironmentObject var transactionStore: TransactionStore
    @Environment(\.presentationMode) var presentationMode
    
    var transaction: Transaction?
    var transactionIndex: Int?
    @State var amount: String = ""
    @State var discription: String = ""
    @State var category: String  = "Income"
    
    var categories = ["Income", "Expense"]
    
    var body: some View {
        Form{
            Section(header: Text("Transaction Details")){
                TextField("Enter amount", text: $amount).keyboardType(.decimalPad)
                TextField("Enter Discription", text:$discription)
                Picker("Category", selection: $category)
                {
                    ForEach(categories, id:\.self){
                        cat in
                        Text(cat)
                    }
                }
                
                Button(action: {saveTransaction()}){
                    Text(transaction != nil ? "Edit Transaction" : "Add Transaction").fontWeight(.bold).padding().background( .red).foregroundColor(.white)
                }
            }
            .navigationTitle(transaction != nil ? "Edit Transaction" : "Add Transaction")
            .navigationBarBackButtonHidden(false)
        }
    }
    func saveTransaction(){
        guard let transactionAmount = Double(amount) else{
            print("Invalid amount")
            return
        }
        
        let newTransaction = Transaction(id: <#UUID#>, amount: transactionAmount, discription: discription, category: category)
        
        //transactionStore.transactions.append(transaction)
        if let index = transactionIndex{
            transactionStore.updateTransaction(newTransaction, at: index)
        }else{
            transactionStore.transactions.append(newTransaction)
        }
        presentationMode.wrappedValue.dismiss()
            
            
    }
    
    func loadTransactionData(){
        if let transaction = transaction{
            amount = String(transaction.amount)
            discription = transaction.discription
            category = transaction.category
        }
    }}

struct TransactionFormView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionFormView()
    }
}
