//
//  EditBookData.swift
//  BookCollectionApp
//
//  Created by admin on 31/01/25.
//

import SwiftUI

struct EditBookData: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var book: Books
    
    @State var title: String = ""
    @State var author: String = ""
    @State var genre: String = ""
    @State var isRead: Bool = false
    @State var dateAdded: Date = Date()
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Edit Book Details")){
                    TextField("EditBook book title", text:$title)
                    TextField("EditBook book author", text:$author)
                    TextField("EditBook book genre", text:$genre)
                    Toggle("Book reading status", isOn: $isRead)
                    DatePicker("Select Date", selection: $dateAdded, displayedComponents: .date)
                    
                }
            }.navigationBarTitle("Edit Book Details", displayMode: .inline)
                .navigationBarItems(leading: Button("Cencel"){
                    dismiss()
                },
                    trailing: Button("Update"){
                    book.title = title
                    book.author = author
                    book.isRead = isRead
                    book.dateAdded = dateAdded
                    book.genre = genre
                    saveContext()
                    dismiss()
                }.disabled(title.isEmpty)
                )
                .onAppear{
                    title = book.title ?? ""
                    author = book.author ?? ""
                    genre = book.genre ?? ""
                    isRead = book.isRead
                    dateAdded = book.dateAdded ?? Date()
                }
        }
    }
    
    func saveContext(){
        do{
            try viewContext.save()
        }catch{
            print("Error editing book details: \(error)")
        }
    }
}
/*
struct EditBookData_Previews: PreviewProvider {
    static var previews: some View {
        EditBookData()
    }
}*/
