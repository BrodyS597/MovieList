//
//  Movie Controller.swift
//  MovieList
//
//  Created by Brody Sears on 1/19/22.
//

import Foundation

// MARK: - properties
class MovieController {
    static let shared = MovieController()
    var movies = [Movie]()
    
    // MARK: - CRUD
    func createMovie(title: String, runTime: Int, leadActor: String) {
        let newMovie = Movie(title: title, runTime: runTime, leadActor: leadActor)
        movies.append(newMovie)
    }
    
    func update(_ movie: Movie, withTitle title: String, runTime: Int, leadActor: String) {
        movie.title = title
        movie.runTime = runTime
        movie .leadActor = leadActor
    }
    
    func delete(_ movie: Movie) {
        guard let index = movies.firstIndex(where: { $0 == movie }) else { return }
        movies.remove(at: index)
    }
}
