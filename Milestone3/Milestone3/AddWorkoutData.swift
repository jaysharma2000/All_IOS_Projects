//
//  AddWorkoutData.swift
//  Milestone3
//
//  Created by admin on 04/02/25.
//

import SwiftUI

struct AddWorkoutData: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    
    
    @State var exercisename: String = ""
    @State var duration: Double = 0.0
    @State var caloriesBurned: Double = 0.0
    
    var body: some View {
        NavigationView{
            Form {
                Section(header: Text("Add Workout Details")){
                    HStack{
                        VStack{
                            TextField("Enter the exerciseName", text:$exercisename)
                            TextField("Enter the duration", value: $duration, formatter: NumberFormatter()).keyboardType(.decimalPad)
                            TextField("Enter the caloriesBurned", value: $caloriesBurned, formatter: NumberFormatter()).keyboardType(.decimalPad)
                        }
                    }
                }
            }.navigationBarTitle("Add new Workout details", displayMode: .inline)
                .navigationBarItems(leading: Button("Cancel"){
                    dismiss()
                },
                                    trailing:  Button("Save Workout"){
                    saveWorkoutDetails()
                    dismiss()
                }.disabled(exercisename.isEmpty)
                )
        }
    }
    
    private func saveWorkoutDetails(){
        let newWorkout = Workouts(context: viewContext)
        
        newWorkout.exerciseName = exercisename
        newWorkout.caloriesBurned = caloriesBurned
        newWorkout.duration = duration
        
        do{
            try viewContext.save()
        }catch{
            print("Error saving details: \(error)")
        }
    }
}

struct AddWorkoutData_Previews: PreviewProvider {
    static var previews: some View {
        AddWorkoutData()
    }
}
