//
//  AddBookView.swift
//  Bookworm
//
//  Created by Joshua Rosado Olivencia on 2/25/25.
//
import SwiftData
import SwiftUI

// ----------------- CHALLENGE 1  VALIDATING TEXTFIELD
extension String {
    var isReallyEmpty : Bool{
        return self.trimmingCharacters(in: .whitespaces).isEmpty
    }
}

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \Book.rating, order: .reverse)var books: [Book]
    
    
    
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = "Placeholder"
    @State private var review = ""

    
    // ----------------- CHALLENGE 1  VALIDATING TEXTFIELD
    var validatingTextField: Bool{
        // Keep false until all of the textfield and picker have been selected.
        if title.isReallyEmpty || author.isReallyEmpty || genre == "Placeholder"{
            return false
        }
        return true
    }
    // ---
    
    
    
    // genre's array for picker
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationStack{
            Form{ // Form to submit the book we want to add
                Section{
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    // Genre Selection
                    Picker("Genre", selection: $genre){
                        // Adding a placeholder
                        if genre == "Placeholder"{
                            // while genre equals "PlaceHolder"
                            // Display "Select ..." as a PlaceHolder
                            Text("Select ...").tag("Placeholder")
                        }
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
                
                    
                .disabled(!validatingTextField)
                
            }
            
            .navigationTitle("Add Book")
        }
    }
}


//#Preview {
//    AddBookView()
//}
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
