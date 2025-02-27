//
//  ViewAllWorkouts.swift
//  Milestone3
//
//  Created by admin on 04/02/25.
//

import SwiftUI

struct ViewAllWorkouts: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Workouts.entity(), sortDescriptors: []) private var workouts: FetchedResults<Workouts>
    
    @State private var showAddWorkout = false
    var body: some View {
        NavigationView{
            List{
                ForEach(workouts){ workout in
                    NavigationLink(destination: EditWorkoutData(workout: workout)){
                        HStack{
                            VStack(alignment: .leading){
                                Text("Exercise Name ").bold() + Text("\(workout.exerciseName ?? "No exercise available")")
                                Text("Exercise Duration ").bold() + Text("\(workout.duration )") + Text(" hr")
                                Text("Calories Burned ").bold() + Text("\(workout.caloriesBurned )")
                                
                            }
                        }
                    }.swipeActions{
                        Button(role: .destructive){
                            deleteWorkout(workout)
                        }label: {
                            Label("Delete", systemImage: "trask")
                        }
                    }
                }
            }.navigationTitle("View Workout Details")
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button(action: {showAddWorkout = true}){
                            Image(systemName: "plus")
                        }
                    }
                }.sheet(isPresented: $showAddWorkout){
                    AddWorkoutData()
                }
        }
    }
    
    private func deleteWorkout(_ workout: Workouts){
        viewContext.delete(workout)
        
        do{
            try viewContext.save()
        }catch{
            print("Error while deleting workout: \(error) ")
        }
    }
}

struct ViewAllWorkouts_Previews: PreviewProvider {
    static var previews: some View {
        ViewAllWorkouts()
    }
}
