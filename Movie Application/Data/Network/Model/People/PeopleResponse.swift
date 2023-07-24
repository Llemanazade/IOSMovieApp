//
//  PeopleResponse.swift
//  Movie Application
//
//  Created by Laman Akhundzade on 23.12.22.
//

import Foundation

struct PeopleResponse: Decodable {
    let results: [People]
    let totalPages: Int
}
