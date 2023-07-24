//
//  SerieResponse.swift
//  Movie Application
//
//  Created by Laman Akhundzade on 23.12.22.
//

import Foundation

struct SerieResponse: Decodable {
    let totalPages: Int
        let results: [Serie]
}
