//
//  SerieCredit.swift
//  Movie Application
//
//  Created by Laman Akhundzade on 23.12.22.
//

import Foundation

struct SerieCredit: Decodable {
    
    let cast: [SerieCast]
    let crew: [SerieCrew]
}
