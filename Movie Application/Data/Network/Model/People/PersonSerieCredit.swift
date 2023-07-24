//
//  PersonSerieCredits.swift
//  Movie Application
//
//  Created by Laman Akhundzade on 26.12.22.
//
import Foundation

struct PersonSerieCredit: Decodable {
    let cast: [PersonSerieCast]
}

struct PersonSerieCast: Decodable, Identifiable {
    let id: Int
    let character: String?
    let name: String
    let posterPath: String?
    
    var posterUrl: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath ?? "")")!
    }
}


