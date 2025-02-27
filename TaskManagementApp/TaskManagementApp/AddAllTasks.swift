//
//  AddAllTasks.swift
//  TaskManagementApp
//
//  Created by admin on 01/02/25.
//

import SwiftUI

struct AddAllTasks: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    
    @State var title: String  = ""
    @State var category: String  = ""
    @State var dueDate: Date  = Date()
    @State var isCompleted: Bool  = false
  //  @State var title: String  = ""
    
    @State var categories = ["Sports", "Study", "Workout"]

    var body: some View {
        NavigationView{
            Form{
                Section(header:Text("Add Your Tasks")){
                    HStack{
                        VStack{
                            TextField("Enter the title", text:$title)
                            Toggle(isOn: $isCompleted){
                                Text(isCompleted ? "Completed" : "Pending")
                            }
                            DatePicker("Select Date", selection: $dueDate, displayedComponents: .date)
                            Picker("Select Category", selection: $category){
                                ForEach(categories, id: \.self){
                                    category in
                                    Text(category)
                                }
                            }.pickerStyle(SegmentedPickerStyle())
                            
                        }
                    }
                }
            }.navigationBarTitle("Add new Task details", displayMode: .inline)
                .navigationBarItems(leading: Button("Cancel"){
                    dismiss()
                },
                    trailing: Button("Save Book"){
                    saveTaskDetails()
                    dismiss()
                }.disabled(title.isEmpty)
                )
        }
    }
    
    private func saveTaskDetails(){
        let newTask = Tasks(context: viewContext) 
        
        newTask.title = title
        newTask.category = category
        newTask.dueDate = dueDate
        newTask.isCompleted = isCompleted
        
        do{
            try viewContext.save()
            
        }catch{
            print("Error saving contact: \(error)")
        }
    }
}

struct AddAllTasks_Previews: PreviewProvider {
    static var previews: some View {
        AddAllTasks()
    }
}
