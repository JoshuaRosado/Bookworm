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
import SwiftData
import SwiftUI

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext // Reads out the model content
    
    @Query var students: [Student] // @Query loads Student from it Model Container for us
    
    
    var body: some View {
        NavigationStack{
            List(students) { student in
                Text("\(student.name)")
            }
            .navigationTitle("Classroom")
            .toolbar {
                Button("Add"){
                    let firstNames = ["Khai", "Leya", "JJ", "Lexi"]
                    let middleNames = ["Asher", "Grace", "Junior","Elizabeth"]
                    
                    
                    let chosenFirstName = firstNames.randomElement()!
                    let chosenMiddleName = middleNames.randomElement()!
                    
                    // New Object with id, random name and random middle name
                    let student = Student(id: UUID(), name: "\(chosenFirstName) \(chosenMiddleName)")
                    
                    
                    // When Add button is tapped, add New Object of Student into the our Model
                    modelContext.insert(student)
                    print(student.name)
                    print(modelContext)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
