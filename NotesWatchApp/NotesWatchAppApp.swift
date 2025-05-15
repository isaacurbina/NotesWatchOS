//
//  NotesWatchAppApp.swift
//  NotesWatchApp
//
//  Created by Isaac Urbina on 5/15/25.
//

import SwiftUI

@main
struct NotesWatchAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
