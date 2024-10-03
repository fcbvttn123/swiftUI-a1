//
//  a1App.swift
//  a1
//
//  Created by David Vu on 2024-10-02.
//

import SwiftUI

@main
struct a1App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
