//
//  ContentView.swift
//  TaskManagementApp
//
//  Created by admin on 01/02/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: Tasks.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Tasks.isCompleted, ascending: true)]) private var tasks: FetchedResults<Tasks>
     
    @State private var showAddTasks = false
    var body: some View {
        NavigationView{
            VStack{
                Text("Task Management App").font(.headline).padding()
                NavigationLink(destination: AddAllTasks() ){
                    Text("Add Task")
                }.font(.headline)
                    .padding().background(.red)
                
                List{
                    ForEach(tasks, id: \.self){ task in
                        NavigationLink(destination: ViewAllTasks(task: task)){
                            HStack{
                                VStack(alignment: .leading){
                                    Text("Title ").bold() + Text("\(task.title ?? "No title available")")
                                }
                            }
                        }.swipeActions{
                            Button(role: .destructive){
                                deleteTask(task)
                            }label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                        /*.navigationTitle("View Task Details")
                            .toolbar{
                                ToolbarItem(placement: .navigationBarTrailing){
                                    Button(action: {showAddTasks = true}){
                                        Image(systemName: "plus")
                                    }
                                }
                            }.sheet(isPresented: $showAddTasks){
                                AddAllTasks()
                            }*/
                        
                    }
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
    }}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
