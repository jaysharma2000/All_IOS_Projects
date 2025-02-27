//
//  SelectedTaskDetails.swift
//  TaskManagementApp
//
//  Created by admin on 01/02/25.
//

import SwiftUI

struct SelectedTaskDetails: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: Tasks.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Tasks.isCompleted, ascending: true)]) private var tasks: FetchedResults<Tasks>
    
    @ObservedObject var task: Tasks
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}
/*
struct SelectedTaskDetails_Previews: PreviewProvider {
    static var previews: some View {
        SelectedTaskDetails()
    }
}
*/
