//
//  ViewAllBooks.swift
//  BookCollectionApp
//
//  Created by admin on 31/01/25.
//

import SwiftUI

struct ViewAllBooks: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: Books.entity(), sortDescriptors: []) private var books: FetchedResults<Books>
    
    @State private var showAddBook = false
    var body: some View {
        NavigationView{
            List{
                ForEach(books){ book in
                    NavigationLink(destination: EditBookData(book: book)){
                        HStack{
                            VStack(alignment: .leading){
                                Text("Title").bold() + Text("\(book.title ?? "No Title available")")
                                Text("Author").bold() + Text("\(book.author ?? "No author available")")
                                Text("Genre").bold() + Text("\(book.genre ?? "No Genre available")")
                                Text("Reading Status: ").bold() + Text(book.isRead ? "Read" : "Not Read")
                                Text("Current Date: ").bold() + Text(book.dateAdded ?? Date(), style: .date)

                            }
                        }
                    }.swipeActions{
                        Button(role: .destructive){
                            deleteBook(book)
                        }label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                }
            }.navigationTitle("View Book Details")
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button(action: {showAddBook = true}){
                            Image(systemName: "plus")
                        }
                    }
                }.sheet(isPresented: $showAddBook){
                    AddBookData()
                }
        }
    }
    
    private func deleteBook(_ book: Books){
        viewContext.delete(book)
        do{
            try viewContext.save()
        }catch{
            print("Error while deleteing book: \(error)")
        }
    }
}

struct ViewAllBooks_Previews: PreviewProvider {
    static var previews: some View {
        ViewAllBooks()
    }
}
