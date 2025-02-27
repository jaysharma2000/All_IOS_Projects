//
//  ViewAllContacts.swift
//  ContactsApp
//
//  Created by admin on 30/01/25.
//

import SwiftUI

struct ViewAllContacts: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Contacts.entity(), sortDescriptors: []) private var contacts: FetchedResults<Contacts>
    
    @State private var showAddContact = false
    var body: some View {
        NavigationView{
            List{
                ForEach(contacts){ contact in
                    NavigationLink(destination: EditContact(contact: contact)){
                        HStack{
                            VStack(alignment: .leading) {
                                    Text("Name:").bold() + Text(" \(contact.name ?? "No name available")")
                                    Text("Mobile Number:").bold() + Text(" \(String(contact.number) )")
                                    Text("Email:").bold() + Text(" \(contact.email ?? "No email available")")
                                    Text("Address:").bold() + Text(" \(contact.address ?? "No address available")")
                                }
                        }
                    }.swipeActions{
                        Button(role: .destructive){
                            deleteContact(contact)
                        }label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                }
            }.navigationTitle("View Contacts")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: { showAddContact = true}){
                        Image(systemName : "plus")
                    }
                }
            }.sheet(isPresented: $showAddContact){
                AddContacts()
            }
        }
    }
    
    private func deleteContact(_ contact: Contacts ){
        viewContext.delete(contact)
        do{
            try viewContext.save()
            
        }catch{
            print("error while deleting contact \(error)")
        }
    }
}


struct ViewAllContacts_Previews: PreviewProvider {
    static var previews: some View {
        ViewAllContacts()
    }
}
