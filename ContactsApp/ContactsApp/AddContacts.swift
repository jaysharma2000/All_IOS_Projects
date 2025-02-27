//
//  AddContacts.swift
//  ContactsApp
//
//  Created by admin on 30/01/25.
//

import SwiftUI

struct AddContacts: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    
    @State var name: String = ""
    @State var email: String = ""
    @State var address: String = ""
    @State var number: String = ""
   // @State var name: String = ""
    
    var body: some View {
        NavigationView{
            Form{
                Section(header:Text("Add Contacts")){
                    HStack{
                        VStack{
                            TextField("Enter the name", text:$name)
                            TextField("Enter the number", text:$number)
                            TextField("Enter the email address", text:$email)
                            TextField("Enter the addesss", text: $address)
                        }
                    }
                }
            }.navigationBarTitle("Add new contact", displayMode: .inline)
                .navigationBarItems(leading: Button("Cancel"){
                    dismiss()
                },
                    trailing: Button("Save Contact"){
                    saveContact()
                    dismiss()
                }.disabled(name.isEmpty)
                
            )
        }
    }
    private func saveContact(){
        let newContact = Contacts(context: viewContext)
        
        newContact.id = UUID()
        newContact.name = name
        newContact.number = Int32(number) ?? 0000
        newContact.email = email
        newContact.address = address
        
        do{
            try viewContext.save()
        }catch{
            print("Error saving contact: \(error)")
        }
    }
}

struct AddContacts_Previews: PreviewProvider {
    static var previews: some View {
        AddContacts()
    }
}
