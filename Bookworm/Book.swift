//
//  Book.swift
//  Bookworm
//
//  Created by Joshua Rosado Olivencia on 2/25/25.
//

import Foundation
import SwiftData

// ----------------- CHALLENGE 1  VALIDATING TEXTFIELD
extension String {
    var isReallyEmpty : Bool{
        return self.trimmingCharacters(in: .whitespaces).isEmpty
    }
}

@Model
class Book {
    var title: String
    var author: String
    var genre: String
    var review: String
    var rating: Int
    
    
    // ----------------- CHALLENGE 1  VALIDATING TEXTFIELD
    var validatingTextField: Bool{
        if title.isReallyEmpty || author.isReallyEmpty || genre.isReallyEmpty{
            return false
        }
        return true
    }
    // ----------------------------------------------------
    
    init(title: String, author: String, genre: String, review: String, rating: Int) {
        self.title = title
        self.author = author
        self.genre = genre
        self.review = review
        self.rating = rating
    }
}
