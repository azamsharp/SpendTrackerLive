//
//  SpendTrackerApp.swift
//  SpendTracker
//
//  Created by Mohammad Azam on 1/13/24.
//

import SwiftUI

@main
struct SpendTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Budget.self)
        }
    }
}
