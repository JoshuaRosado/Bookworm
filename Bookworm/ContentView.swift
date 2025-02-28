//
//  ContentView.swift
//  Bookworm
//
//  Created by Joshua Rosado Olivencia on 2/23/25.
//
import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var books: [Book]
    
    
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationStack{
            // Display a list
            List {
                // For each book added
                ForEach(books){ book in
                    // Each book having a navigationLink to using itself as a value
                    NavigationLink(value : book) {
                        // HStack with the Emoji display at the left side displaying the emoji according the rating submitted
                        HStack {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            
                            // at the right side Display Author of the book
                            VStack(alignment: .leading){
                                
                                Text(book.title)
                                    .font(.headline)
                                
                                
                                Text(book.author)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
                .onDelete(perform: removeObject)
            }
            
                .navigationTitle("Bookworm")
            // Give a navigation Destination for [Book]
                .navigationDestination(for: Book.self) { book in
                    // For each book, Display it in DetailView
                    DetailView(book:book)
                }
                .toolbar{
                    ToolbarItem(placement: .topBarTrailing){
                        Button("Add Book", systemImage: "plus"){
                            showingAddScreen.toggle()
                        }
                    }
                }
                .sheet(isPresented: $showingAddScreen){
                    AddBookView()
                }
        }
    }
    func removeObject(at offsets: IndexSet){
        for offset in offsets {
            // find this book in our Query
            let book = books[offset]
            // delete it from the context
            modelContext.delete(book)
        }
    }
}

#Preview {
    ContentView()
}
