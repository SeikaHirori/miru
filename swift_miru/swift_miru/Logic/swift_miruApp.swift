//
//  swift_miruApp.swift
//  swift_miru
//
//  Created by Seika Hirori on 4/15/23.
//

import SwiftUI

@main
struct swift_miruApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
