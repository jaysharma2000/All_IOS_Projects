//
//  ContactsAppApp.swift
//  ContactsApp
//
//  Created by admin on 30/01/25.
//

import SwiftUI

@main
struct ContactsAppApp: App {
    let persistentController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, persistentController.container.viewContext)
        }
    }
}
