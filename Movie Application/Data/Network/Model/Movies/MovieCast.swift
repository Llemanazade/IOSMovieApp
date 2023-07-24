//
//  MovieCast.swift
//  Movie Application
//
//  Created by Laman Akhundzade on 22.12.22.
//

import Foundation

struct MovieCast: Decodable, Identifiable {
    let id: Int
    let character: String
    let name: String
    let profilePath: String?
    
    var profileURL: URL {
        
        return URL(string: "https://image.tmdb.org/t/p/w500/\(profilePath ?? "")")!
    }
}
