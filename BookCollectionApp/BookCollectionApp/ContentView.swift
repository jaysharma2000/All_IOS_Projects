//
//  ContentView.swift
//  BookCollectionApp
//
//  Created by admin on 31/01/25.
//


import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        entity: Books.entity(),
        sortDescriptors: []
    ) private var books: FetchedResults<Books>
    
    var body: some View {
        NavigationView{
        VStack {
            Text("Book Collection App").font(.system(size: 30)).padding()
            Text("Total Books Added").font(.system(size: 25)).padding(.top, 40)
            HStack{
                Text((books.count >= 0 && books.count < 10) ? "\(0)\(books.count)" : "\(books.count)" ).font(.system(size: 30)).padding(.top, 25)
                
            }
            //Text("\(contacts.count)").font(.system(size: 30)).padding(.top, 25)
            Spacer()
            
            NavigationLink(destination: ViewAllBooks()){
                Text("View All Books")
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
