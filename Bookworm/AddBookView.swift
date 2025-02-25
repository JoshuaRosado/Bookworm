//
//  AddBookView.swift
//  Bookworm
//
//  Created by Joshua Rosado Olivencia on 2/25/25.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = "Fantasy"
    @State private var review = ""
    
    // genre's array for picker
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationStack{
            Form{ // Form to submt the book we want to add
                Section{
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    // Genre Selection
                    Picker("Genre", selection: $genre){
                        ForEach(genres, id: \.self){
                            Text($0)
                        }
                    }
                }
                Section("Write a review"){
                    TextEditor(text:$review)
                    // Rating Selection
                    Picker("Rating", selection: $rating){
                        ForEach(0..<6) {
                            Text(String($0))
                        }
                    }
                }
                
                Section{
                    // Save Button to add book
                    Button("Save") {
                        // New book created
                        let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating)
                        modelContext.insert(newBook) // Add newBook to our model
                        dismiss() // Dismiss View after adding Book
                        
                    }
                }
            }
            .navigationTitle("Add Book")
        }
    }
}

#Preview {
    AddBookView()
}
