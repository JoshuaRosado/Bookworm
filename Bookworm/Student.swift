//
//  Student.swift
//  Bookworm
//
//  Created by Joshua Rosado Olivencia on 2/24/25.
//

import SwiftUI
// import SwiftData
import SwiftData

// DATA THAT WE ARE GOING TO WORK WITH


// first REPLACE Macro

// Macro
// @Observable

// FOR

// Macro
@Model
class Student {
    var id : UUID
    var name: String
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}
