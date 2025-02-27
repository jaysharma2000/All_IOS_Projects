//
//  AddBookData.swift
//  BookCollectionApp
//
//  Created by admin on 31/01/25.
//

import SwiftUI

struct AddBookData: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    
    @State var title: String = ""
    @State var author: String = ""
    @State var genre: String = ""
    @State var isRead: Bool = false
    @State var dateAdded: Date = Date()
    

    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Add Book Details")){
                    HStack{
                        VStack{
                            TextField("Enter the title", text:$title)
                            TextField("Enter the author", text:$author)
                            TextField("Enter the genre", text:$genre)
                            Toggle("Book reading status", isOn: $isRead )
                            DatePicker("Select Date", selection: $dateAdded, displayedComponents: .date)
                            
                        }
                    }
                }
            }.navigationBarTitle("Add new Book details", displayMode: .inline)
                .navigationBarItems(leading: Button("Cancel"){
                    dismiss()
                },
                                    trailing: Button("Save Book"){
                    saveBookDetails()
                    dismiss()
                }.disabled(title.isEmpty)
                
                )
        }
    }
    
    private func saveBookDetails(){
        let newBook = Books(context:  viewContext)
        
        newBook.title = title
        newBook.author = author
        newBook.genre = genre
        newBook.isRead = isRead
        newBook.dateAdded = dateAdded
        
        do{
            try viewContext.save()
                
        }catch{
                    print("Error saving contact: \(error)")
                }
    }
}
/*
struct AddBookData_Previews: PreviewProvider {
    static var previews: some View {
        AddBookData()
    }
}*/
