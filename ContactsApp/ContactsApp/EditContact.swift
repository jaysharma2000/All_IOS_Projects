//
//  EditContact.swift
//  ContactsApp
//
//  Created by admin on 30/01/25.
//

import SwiftUI

struct EditContact: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var contact: Contacts
    
    @State private var name = ""
    @State private var number  = ""
    @State private var email = ""
    @State private var address = ""
    
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Edit Contact")){
                    TextField("Edit contact name", text:$name)
                    TextField("Edit number", text:$number)
                    TextField("Edit email", text:$email)
                    TextField("Edit address", text:$address)
                    
                }
            }
            .navigationBarTitle("Edit Contact", displayMode: .inline)
            .navigationBarItems(leading:Button("Cancel"){
                dismiss()
            },
                trailing: Button("Update"){
                contact.name = name
                contact.number = Int32(number) ?? 0000
                contact.email = email
                contact.address = address
            }.disabled(name.isEmpty)
          )
            .onAppear{
                name = contact.name  ?? ""
                number = String(contact.number)
                email = contact.email ?? ""
                address = contact.address ?? ""
                
            }
        }
    }
}
/*
struct EditContact_Previews: PreviewProvider {
    static var previews: some View {
        EditContact(contact: <#Contacts#>)
    }
}
*/
