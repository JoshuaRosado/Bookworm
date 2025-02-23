//
//  ContentView.swift
//  Bookworm
//
//  Created by Joshua Rosado Olivencia on 2/23/25.
//


// Property Wrappers
//@State = LOCAL value types
//@Bindable = Bindings to properties inside observable classes


//@Binding = Allows us to share an @State that belong to one View with another View

import SwiftUI

struct PushButton: View {
    let title: String
    @Binding var isOn: Bool
    
    var onColors = [Color.red, Color.yellow]
    var offColors = [Color(white:0.6), Color(white: 0.4)]
    
    var body: some View {
        Button(title) {
            isOn.toggle()
        }
        .padding()
        // If Bool (isOn) is true
        // Display onColors
        // If (isOn) is false
        // Display offColors
        .background(LinearGradient(colors: isOn ? onColors : offColors, startPoint: .top, endPoint: .bottom))
        .foregroundStyle(.white)
        .clipShape(.capsule)
        .shadow(radius: isOn ? 0 : 5)
        
    }
}

struct ContentView: View {
    
    @State private var rememberMe = false
    
    var body: some View {
        VStack {
            
            PushButton(title: "Remember Me", isOn: $rememberMe)
            // Using rememberMe with "$" because this parameters is used with @Binding
            
            
            Text(rememberMe ? "On" : "Off")
            
        }
        
    }
}

#Preview {
    ContentView()
}
