//
//  AddBookView.swift
//  Bookworm
//
//  Created by Joshua Rosado Olivencia on 2/25/25.
//
import SwiftData
import SwiftUI

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = "Fantasy"
    @State private var review = ""

    
//    @Binding var validatingTextField : Bool
    
    
    
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
                    RatingView(rating: $rating)
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
//                .disabled(!book.validatingTextField)
            }
            
            .navigationTitle("Add Book")
        }
    }
}

//#Preview {
//    do {
//        // New ModelConfiguration, Temporary
//        let config = ModelConfiguration(isStoredInMemoryOnly: true)
//        
//        // Make a new container out of the Temporary Model
//        let container = try ModelContainer(for: Book.self , configurations: config)
//        
//        // Sample Book ( for preview )
//        let example = Book(title: "Test Book", author: "Test Author", genre: "Fantasy", review: "This was a great book; I really enjoyed it", rating: 4)
//        
//        // Send back Detail View passing the (Temporary)Sample Book as our book
//        return AddBookView(book: example)
//        // Using our Temporary container as ModelContainer
//            .modelContainer(container)
//    } catch {
//        // Catch and return any errors
//        return Text("Failed to create preview: \(error.localizedDescription)")
//    }
//}
