//
//  EmojiRatingView.swift
//  Bookworm
//
//  Created by Joshua Rosado Olivencia on 2/27/25.
//

import SwiftUI

struct EmojiRatingView: View {
    let rating: Int
    
    // Use a switch to Display an emoji depending on the "rating" giving. 1-5
    var body: some View {
        switch rating {
        case 1:
            Text("☹️")
        case 2:
            Text("🥱")
        case 3:
            Text("😕")
        case 4:
            Text("😊")
            
        default:
            Text("🤯")
            
        }
    }
}

#Preview {
    EmojiRatingView(rating: 3 )
}
