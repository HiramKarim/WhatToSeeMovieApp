//
//  AddMovieScreen.swift
//  WhatToSeeApp
//
//  Created by Hiram Castro on 09/02/24.
//

import SwiftUI

struct AddMovieScreen: View {
    
    @Environment(\.presentationMode) var presentionMode
    @State private var title: String = ""
    @State private var director: String = ""
    @State private var releaseDate: Date = Date()
    @State private var rating: Int? = nil
    
    var body: some View {
        Form {
            TextField("Enter name", text: $title)
            TextField("Director name", text: $director)
            HStack {
                Text("Rating")
                Spacer()
                RatingView(rating: $rating)
            }
            DatePicker("Release Date", selection: $releaseDate)
            HStack {
                Spacer()
                Button("Save") {
                    
                }
                Spacer()
            }
        }
        .navigationTitle("Add Movie")
        .embedInNavigationView()
    }
    
}

#Preview {
    AddMovieScreen()
}
