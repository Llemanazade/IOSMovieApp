//
//  MovieCrew.swift
//  Movie Application
//
//  Created by Laman Akhundzade on 22.12.22.
//

import Foundation

struct MovieCrew: Decodable, Identifiable {
    let id: Int
    let job: String
    let name: String
}
