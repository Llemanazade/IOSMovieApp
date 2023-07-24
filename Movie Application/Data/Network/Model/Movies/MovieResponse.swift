//
//  MovieResponse.swift
//  Movie Application
//
//  Created by Laman Akhundzade on 22.12.22.
//

import Foundation

struct MovieResponse: Decodable {
        let totalPages: Int
        let results: [Movie]
}
