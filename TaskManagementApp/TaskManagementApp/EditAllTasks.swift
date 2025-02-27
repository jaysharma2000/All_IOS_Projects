//
//  EditAllTasks.swift
//  TaskManagementApp
//
//  Created by admin on 01/02/25.
//

import SwiftUI

struct EditAllTasks: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var task: Tasks 
    
    @State var title: String  = ""
    @State var category: String  = ""
    @State var dueDate: Date  = Date()
    @State var isCompleted: Bool  = false
    
    @State var categories = ["Sports", "Study", "Workout"]
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Edit Task Details")){
                    TextField("Edit the title", text:$title)
                    Toggle(isOn: $isCompleted){
                        Text(isCompleted ? "Completed" : "Pending")
                    }
                    DatePicker("Edit Date", selection: $dueDate, displayedComponents: .date)
                    Picker("Edit Category", selection: $category){
                        ForEach(categories, id: \.self){
                            category in
                            Text(category)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    
                }
            }.navigationBarTitle("Edit Task Details", displayMode: .inline)
                .navigationBarItems(leading: Button("Cancel"){
                    dismiss()
                },
                                    trailing: Button("Update"){
                    task.title = title
                    task.category = category
                    task.dueDate = dueDate
                    task.isCompleted = isCompleted
                    saveContext()
                    dismiss()
                }.disabled(title.isEmpty)
                
                )
                .onAppear{
                    title = task.title ?? ""
                    category  = task.category ?? ""
                    dueDate = task.dueDate ?? Date()
                    isCompleted = task.isCompleted 
                }
        }
    }
    
    func saveContext(){
        do{
            try viewContext.save()
            
        }catch{
            print("Error editing task details: \(error)")
        }
    }
}
/*
struct EditAllTasks_Previews: PreviewProvider {
    static var previews: some View {
        EditAllTasks()
    }
}*/
