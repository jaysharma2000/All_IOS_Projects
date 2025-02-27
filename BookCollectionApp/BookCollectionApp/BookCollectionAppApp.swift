//
//  BookCollectionAppApp.swift
//  BookCollectionApp
//
//  Created by admin on 31/01/25.
//

import SwiftUI

@main
struct BookCollectionAppApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
