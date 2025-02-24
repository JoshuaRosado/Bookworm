//
//  ContentView.swift
//  Bookworm
//
//  Created by Joshua Rosado Olivencia on 2/23/25.
//


// Property Wrappers
//@State = LOCAL value types
//@Bindable = Bindings to properties inside observable classes


//@Binding = Allows us to share an @State that belongs to one View with another View


// @AppStorage = Is good to store simple things
// IS NOT SECURE to store private information (username,password,etc)

import SwiftUI

struct ContentView: View {
    
    @AppStorage("notes") private var notes = ""
    
    var body: some View {
        NavigationStack {
            // Using axis will help to expand the TextField to be displayed in multiple lines
            TextField("Enter your text", text: $notes, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .navigationTitle("Notes")
                .padding()
            
        }
    }
}

#Preview {
    ContentView()
}
