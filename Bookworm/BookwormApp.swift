//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Joshua Rosado Olivencia on 2/23/25.
//

// Import SwiftData
import SwiftData
import SwiftUI

@main // Tells SwiftUI, "THIS is what LAUNCHES our app"
struct BookwormApp: App {
    var body: some Scene {
        // WindowGroup = Tells SwiftUI that our app can be displayed in many windows
        WindowGroup  {
            ContentView()
        }
        .modelContainer(for: Student.self) // WHERE the source of Data is
    }
}
