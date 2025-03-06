//
//  Book.swift
//  Bookworm
//
//  Created by Joshua Rosado Olivencia on 2/25/25.
//

import Foundation
import SwiftData


@Model
class Book {
    var title: String
    var author: String
    var genre: String
    var review: String
    var rating: Int
    // CHALLENGE 3 adding date
    var date : Date
    
    
   
    init(title: String, author: String, genre: String, review: String, rating: Int, date: Date) {
        self.title = title
        self.author = author
        self.genre = genre
        self.review = review
        self.rating = rating
        // CHALLENGE 3 adding date
        self.date = date
    }
}
