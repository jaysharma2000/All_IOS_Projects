//
//  Milestone3App.swift
//  Milestone3
//
//  Created by admin on 04/02/25.
//

import SwiftUI

@main
struct Milestone3App: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
