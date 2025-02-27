//
//  ContentView.swift
//  Milestone3
//
//  Created by admin on 04/02/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Workouts.entity(), sortDescriptors: []) private var workouts: FetchedResults<Workouts>
    
    
    
    var body: some View {
        NavigationView{
            VStack {
                Text("Fitness App").font(.system(size: 30)).padding()
                Text("Total Workouts Added").font(.system(size: 25)).padding(.top, 40)
                HStack{
                    Text((workouts.count >= 0 && workouts.count < 10) ? "\(0)\(workouts.count)" : "\(workouts.count)").font(.system(size: 30)).padding(.top, 25)
                }
                Spacer()
                
                
                NavigationLink(destination: ViewAllWorkouts()){
                    Text("View All Workouts")
                }
                
            }.padding(.top, 40)
        }.navigationTitle("DashBoard")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
