//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Joshua Rosado Olivencia on 2/23/25.
//
import SwiftData
import SwiftUI


@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self) // Data Source
    }
}
