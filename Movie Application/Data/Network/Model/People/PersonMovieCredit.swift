//
//  PersonMovieCredits.swift
//  Movie Application
//
//  Created by Laman Akhundzade on 26.12.22.
//
import Foundation

struct PersonMovieCredit: Decodable {
    let cast: [PersonMovieCast]
}

struct PersonMovieCast: Decodable, Identifiable {
    let id: Int
    let character: String?
    let title: String
    let posterPath: String?
    
    var posterUrl: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath ?? "")")!
    }
}
