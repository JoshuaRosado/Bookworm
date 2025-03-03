//
//  DetailView.swift
//  Bookworm
//
//  Created by Joshua Rosado Olivencia on 2/28/25.
//
import SwiftData
import SwiftUI

struct DetailView: View {
    
    // Properties
    // Need one to hold our model Context
    @Environment(\.modelContext) var modelContext
    // Need one to dismiss the View
    @Environment(\.dismiss) var dismiss
    // Need one to show if alert is showing
    @State private var isShowingDeleteAlert = false
    
    
    let book: Book
    
    

    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre)
                    .resizable()
                    .scaledToFit()
                
                Text(book.genre.uppercased())
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundStyle(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(.capsule)
                    .offset(x: -5, y: -5)
            }
            
            Text(book.author)
                .font(.title)
                .foregroundStyle(.secondary)
            
            Text(book.review)
                .padding()
            
            RatingView(rating: .constant(book.rating))
                .font(.largeTitle)
        }
        .navigationTitle(book.title)
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
        
        // Create an alert for Deleting book
        .alert("Delete book", isPresented: $isShowingDeleteAlert){
            // Button for Delete, calling deleteBook() method
            Button("Delete", role: .destructive, action: deleteBook)
            // Button for Cancel
            Button("Cancel", role: .cancel) {}
            // show a confirmation message after tapping Cancel button
        } message: {
            Text("Are you sure?")
        }
        // Create a button in the toolbar to Delete current Book with the image a of a trash can
        .toolbar{
            Button("Delete this book", systemImage: "trash") {
                isShowingDeleteAlert = true
            }
        }
    }
    
    
    // Create delete method
    func deleteBook() {
        // call our modelContext and delete our CURRENT book
        modelContext.delete(book)
        // and call dismiss to get rid of the View
        dismiss()
    }
}


// SAMPLE BOOK OBJECT FOR PREVIEW

// 1 - In order to create a SAMPLE Book object for Preview, we must first create a model context

// 2 - That model context comes from creating a model container

// 3 - If we create a model container, we don't want it to actually store anything, so we can create a custom configuration that tells SwiftData to store its information in memory only. That means everything is temporary

#Preview {
    do {
        // New ModelConfiguration, Temporary
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        
        // Make a new container out of the Temporary Model
        let container = try ModelContainer(for: Book.self , configurations: config)
        
        // Sample Book ( for preview )
        let example = Book(title: "Test Book", author: "Test Author", genre: "Fantasy", review: "This was a great book; I really enjoyed it", rating: 4)
        
        // Send back Detail View passing the (Temporary)Sample Book as our book
        return DetailView(book: example)
        // Using our Temporary container as ModelContainer
            .modelContainer(container)
    } catch {
        // Catch and return any errors
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
