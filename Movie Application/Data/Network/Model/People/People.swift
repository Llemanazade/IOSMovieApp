//
//  People.swift
//  Movie Application
//
//  Created by Laman Akhundzade on 23.12.22.
//

import Foundation

struct People:Decodable, Identifiable, Hashable {
    
    static func == (lhs: People, rhs: People) -> Bool {
            lhs.id == rhs.id
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
    
    let adult: Bool
    let gender: Int
    let id: Int
    let knownForDepartment: String
    let name: String
    let popularity: Double
    let profilePath: String?
    let biography: String?
    
    let movieCredits: PersonMovieCredit?
    let tvCredits: PersonSerieCredit?
    
    var profileUrl: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500\(profilePath ?? "")")!
    }
    
    var ratingText: String {
        let rating = Int(popularity)
        let ratingText = (0..<rating).reduce("") { (acc, _) -> String in
            return acc + "★"
        }
        return ratingText
    }
    
    var scoreText: String {
        guard ratingText.count > 0 else {
            return "n/a"
        }
        return "\(ratingText.count)"
    }
    
    var movieCast: [PersonMovieCast]? {
        movieCredits?.cast
    }
    
    var serieCast: [PersonSerieCast]? {
        tvCredits?.cast
    }
}
