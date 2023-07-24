//
//  SerieCrew.swift
//  Movie Application
//
//  Created by Laman Akhundzade on 23.12.22.
//

import Foundation

struct SerieCrew: Decodable, Identifiable {
    let id: Int
    let job: String
    let name: String
}
