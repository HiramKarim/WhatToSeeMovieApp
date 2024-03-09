//
//  ContentView.swift
//  WhatToSeeApp
//
//  Created by Hiram Castro on 08/02/24.
//

import SwiftUI

struct MovieListScreen: View {
    
    @StateObject private var movieListVM = MovieListVM()
    @State private var isPresented: Bool = false
    
    var body: some View {
        List {
            ForEach(movieListVM.movies, id: \.id) { movie in
                MovieCell(movie: movie)
            }.onDelete(perform: deleteMovie)
        }
        .listStyle(.plain)
        .navigationTitle("Movies")
        .navigationBarItems(trailing: Button("Add Movie") {
            isPresented = true
        })
        .sheet(isPresented: $isPresented, 
        onDismiss: {
            movieListVM.getAllMovies()
        }, content: {
            AddMovieScreen()
        })
        .embedInNavigationView()
        .onAppear(perform: {
            movieListVM.getAllMovies()
        })
    }
    
    private func deleteMovie(at indexSet: IndexSet) {
        indexSet.forEach { index in
            //get movie
            let movie = movieListVM.movies[index]
            //delete
            movieListVM.deleteMovie(movie: movie)
            //get all movies
            movieListVM.getAllMovies()
        }
    }
}

struct MovieCell: View {
    
    let movie: MovieDTO
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(movie.title)
                    .fontWeight(.bold)
                Text(movie.director)
                    .font(.caption2)
                Text(movie.relreaseDate ?? "")
                    .font(.caption)
            }
            Spacer()
            RatingView(rating: .constant(movie.rating))
        }
    }
}

#Preview {
    MovieListScreen()
}
