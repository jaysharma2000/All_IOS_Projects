//
//  EditWorkoutData.swift
//  Milestone3
//
//  Created by admin on 04/02/25.
//

import SwiftUI

struct EditWorkoutData: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var workout: Workouts
    
    @State var exercisename: String = ""
    @State var duration: Double = 0.0
    @State var caloriesBurned: Double = 0.0

    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Edit Workout Details")){
                    TextField("Enter the exerciseName", text:$exercisename)
                    TextField("Enter the duration", value: $duration, formatter: NumberFormatter()).keyboardType(.decimalPad)
                    TextField("Enter the caloriesBurned", value: $caloriesBurned, formatter: NumberFormatter()).keyboardType(.decimalPad)
                    
                }
            }
            .navigationBarTitle("Edit Workout Details", displayMode: .inline)
            .navigationBarItems(leading: Button("Cancle"){
                dismiss()
            },
                                trailing:  Button("Update"){
                workout.exerciseName = exercisename
                workout.caloriesBurned = caloriesBurned
                workout.duration = duration
                saveContext()
                dismiss()
            }.disabled(exercisename.isEmpty)
            )
            .onAppear{
                exercisename = workout.exerciseName ?? ""
                duration = workout.duration
                caloriesBurned = workout.caloriesBurned
            }
        }
    }
    
    func saveContext(){
        do{
            try viewContext.save()
        }catch{
            print("Error editing workout details: \(error)")
        }
    }
}
/*
struct EditWorkoutData_Previews: PreviewProvider {
    static var previews: some View {
        EditWorkoutData()
    }
}*/
