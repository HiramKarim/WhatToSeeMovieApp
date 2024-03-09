//
//  AddMovieScreen.swift
//  WhatToSeeApp
//
//  Created by Hiram Castro on 09/02/24.
//

import SwiftUI

struct AddMovieScreen: View {
    
    @StateObject private var addMovieVM = AddMovieVM()
    @Environment(\.presentationMode) var presentionMode
    
    var body: some View {
        Form {
            TextField("Enter name", text: $addMovieVM.title)
            TextField("Director name", text: $addMovieVM.director)
            HStack {
                Text("Rating")
                Spacer()
                RatingView(rating: $addMovieVM.rating)
            }
            DatePicker("Release Date", selection: $addMovieVM.releaseDate)
            HStack {
                Spacer()
                Button("Save") {
                    addMovieVM.save()
                    presentionMode.wrappedValue.dismiss()
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
