//
//  RatingView.swift
//  Bookworm
//
//  Created by Joshua Rosado Olivencia on 2/26/25.
//

import SwiftUI

struct RatingView: View {
    
    @Binding var rating: Int
    
    var label = ""
    var maximumRating = 5
    
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
    
    var body: some View {
        HStack{
            if label.isEmpty == false {
                Text(label)
            }
            // for each number itself
            ForEach(1..<maximumRating + 1, id: \.self) { number in
                    // Make a Button
                Button {
                    print("Tapped \(number)")
                    //When pressed make "rating:Int" equal that "number"
                    rating = number
                } label : {
                    // Using image func
                    // taking "number" and returning Image
                    image(for: number)
                    // if number(Image index) is greater then our rating, make it offColor
                        .foregroundStyle(number > rating ? offColor: onColor)
                    // Image(stars)count that equals rating are going to be onColor
                }
            }
        }
        .buttonStyle(.plain) // This will make each Rating Star button be a Individual button when tapped
    }
    
    // Takes a number and returns an Image
    func image(for number: Int) -> Image {
        // if that number is greater than current rating
        if number > rating {
            // if there's an "offImage" return, if not return "onImage"
            offImage ?? onImage
            // else if number is lesser than current rating
            //return onImage
        } else {
            onImage
        }
    }
}

#Preview {
    RatingView(rating: .constant(4)) // Constant value of 4
    // Perfect for using in Previews
}
