//
//  ContentView.swift
//  ContactsApp
//
//  Created by admin on 30/01/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        entity: Contacts.entity(),
        sortDescriptors: []
    ) private var contacts: FetchedResults<Contacts>
    
    var body: some View {
        NavigationView{
        VStack {
            Text("Contacts App").font(.headline).padding()
            Text("Total Contacts").font(.headline)
            Text("\(contacts.count)").font(.subheadline)
            Spacer()
            
            NavigationLink(destination: ViewAllContacts()){
                Text("View All Contacts")
            }
        }
        .padding(.top, 40)
    }.navigationTitle("Dashboard")}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
