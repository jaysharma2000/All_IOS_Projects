//
//  EditTransactionView.swift
//  PersonalBudgetTracker
//
//  Created by admin on 28/01/25.
//

import SwiftUI
/*
struct EditTransactionView: View {
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
                
                Button(action: {editTransaction()}){
                    Text("Edit Transaction").fontWeight(.bold).padding().background( .red).foregroundColor(.white)
                }
            }.onAppear{loadTransactionData()}
            .navigationTitle("Edit Transaction")
            .navigationBarBackButtonHidden(false)
        }
    }
    
    func editTransaction(){
        
        guard let transaction = transaction else {
                print("Error: Transaction is nil")
                return
            }
        
        guard let transactionAmount = Double(amount) else{
            print("Invalid amount")
            return
        }
        
        /*let transaction = Transaction(id: UUID(), amount: transactionAmount, discription: discription, category: category)
        
        transactionStore.updateTransaction(transaction, at: transactionIndex! )
        presentationMode.wrappedValue.dismiss()*/
        
        guard transactionIndex! >= 0, transactionIndex! < transactionStore.transactions.count else {
                    print("Error: Transaction index out of bounds")
                    return
                }
                
                let updatedTransaction = Transaction(
                    id: transaction.id,
                    amount: transactionAmount,
                    discription: discription,
                    category: category
                )
                
        transactionStore.updateTransaction(updatedTransaction, at: transactionIndex!)
                presentationMode.wrappedValue.dismiss()
            
    }
    
    func loadTransactionData(){
        if let transaction = transaction{
            amount = String(transaction.amount)
            discription = transaction.discription
            category = transaction.category
        }
    }
}

struct EditTransactionView_Previews: PreviewProvider {
    static var previews: some View {
        EditTransactionView()
    }
}
*/






struct EditTransactionView: View {
    @EnvironmentObject var transactionStore: TransactionStore
    @Environment(\.presentationMode) var presentationMode

    var transaction: Transaction
    let transactionIndex: Int // Now non-optional

    @State var amount: String = ""
    @State var discription: String = ""
    @State var category: String  = "Income"

    var categories = ["Income", "Expense"]

    var body: some View {
        Form {
            Section(header: Text("Transaction Details")) {
                TextField("Enter amount", text: $amount).keyboardType(.decimalPad)
                TextField("Enter Discription", text: $discription)
                Picker("Category", selection: $category) {
                    ForEach(categories, id: \.self) { cat in
                        Text(cat)
                    }
                }

                Button(action: { editTransaction() }) {
                    Text("Edit Transaction")
                        .fontWeight(.bold)
                        .padding()
                        .background(.red)
                        .foregroundColor(.white)
                }
            }
        }
        .onAppear { loadTransactionData() }
        .navigationTitle("Edit Transaction")
        .navigationBarBackButtonHidden(false)
    }

    func editTransaction() {
        guard let transactionAmount = Double(amount) else {
            print("Invalid amount")
            return
        }

        guard transactionIndex >= 0, transactionIndex < transactionStore.transactions.count else {
            print("Error: Transaction index out of bounds")
            return
        }

        let updatedTransaction = Transaction(
            id: transaction.id,
            amount: transactionAmount,
            discription: discription,
            category: category
        )

        DispatchQueue.main.async {
            transactionStore.updateTransaction(updatedTransaction, at: transactionIndex)
            presentationMode.wrappedValue.dismiss()
        }
    }

    func loadTransactionData() {
        amount = String(transaction.amount)
        discription = transaction.discription
        category = transaction.category
    }
}
