//
//  RatingView.swift
//  WhatToSeeApp
//
//  Created by Hiram Castro on 09/02/24.
//

import SwiftUI

struct RatingView: View {
    
    @Binding var rating: Int?
    private let starFillName = "star.fill"
    private let starName = "star"
    
    private func startType(index: Int) -> String {
        if let rating = self.rating {
            return index <= rating ? starFillName : starName
        } else {
            return "star"
        }
    }
    
    var body: some View {
        HStack {
            ForEach(1...5, id: \.self) { index in
                Image(systemName: self.startType(index: index))
                    .foregroundColor(Color.orange)
                    .onTapGesture {
                        self.rating = index
                    }
            }
        }
    }
}

#Preview {
    RatingView(rating: .constant(3))
}
