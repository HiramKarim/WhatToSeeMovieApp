//
//  MovieListVM.swift
//  WhatToSeeApp
//
//  Created by Hiram Castro on 15/02/24.
//

import Foundation
import CoreData

class MovieListVM: ObservableObject {
    
    @Published var movies = [MovieDTO]()
    
    func getAllMovies() {
        
        let movies = CoreDataManager.shared.getAllMovies()
        DispatchQueue.main.async {
            self.movies = movies.map(MovieDTO.init)
        }
    }
    
    func deleteMovie(movie: MovieDTO) {
        let filteredMovie = CoreDataManager.shared.getMovieById(id: movie.id)
        guard let movieToDelete = filteredMovie
        else {
            return
        }
        CoreDataManager.shared.deleteMovie(movieToDelete)
    }
    
}

struct MovieDTO {
    
    let movie: Movie
    
    var id: NSManagedObjectID {
        return movie.objectID
    }
    
    var title: String {
        return movie.title ?? ""
    }
    
    var director: String {
        return movie.director ?? "Not available"
    }
    
    var relreaseDate: String? {
        return movie.releaseDate?.asFormattedString()
    }
    
    var rating: Int? {
        return Int(movie.rating)
    }
    
}
