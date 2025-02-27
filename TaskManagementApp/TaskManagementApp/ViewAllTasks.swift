//
//  ViewAllTasks.swift
//  TaskManagementApp
//
//  Created by admin on 01/02/25.
//

import SwiftUI

struct ViewAllTasks: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Tasks.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Tasks.isCompleted, ascending: true)]) private var tasks: FetchedResults<Tasks>
    
    @State private var showAddTasks = false
    
    @ObservedObject var task: Tasks

    var body: some View {
        NavigationView{
            VStack{
            List{
            //ForEach(tasks, id: \.self){ task in
            NavigationLink(destination: EditAllTasks(task: task)){
                HStack{
                    VStack(alignment: .leading){
                        Text("Title ").bold() + Text("\(task.title ?? "No title available" )")
                        Text("Category ").bold() + Text("\(task.category ?? "No category available" )")
                        Text("Completed Status ").bold() + Text(task.isCompleted ? "Completed" : "Pending" )
                        Text("Due Date ").bold() + Text(task.dueDate ?? Date(), style: .date )
                        
                    }
                }
            }.swipeActions{
                Button(role: .destructive){
                    deleteTask(task)
                }label: {
                    Label("Delete", systemImage: "trash")
                }
            }
            // }
            }
            .navigationTitle("View Task Details")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {showAddTasks = true}){
                        Image(systemName: "plus")
                    }
                }
            }.sheet(isPresented: $showAddTasks){
                AddAllTasks()
            }
        }
        }
    }
    
    private func deleteTask(_ task: Tasks){
        viewContext.delete(task)
        
        do{
            try viewContext.save()
        }catch{
            print("Error while deleting book: \(error)")
        }
    }
}
/*
struct ViewAllTasks_Previews: PreviewProvider {
    static var previews: some View {
        ViewAllTasks()
    }
}*/
