//
//  Movie.swift
//  MovieList
//
//  Created by Brody Sears on 1/19/22.
//

import Foundation

class Movie {
    // MARK: - Properties
    var title: String
    var runTime: Int
    var leadActor: String
    
    // MARK: - Memberwise Initializer
    /// Used to create a new `Movie` Intance
    init(title: String, runTime: Int, leadActor: String) {
        self.title = title
        self.runTime = runTime
        self.leadActor = leadActor
    }
}

// MARK: - Conforming to equatable
extension Movie: Equatable {
    static func == (lhs: Movie, rhs: Movie) -> Bool {
        return lhs.title == rhs.title &&
        lhs.runTime == rhs.runTime &&
        lhs.leadActor == rhs.leadActor
    }
}
