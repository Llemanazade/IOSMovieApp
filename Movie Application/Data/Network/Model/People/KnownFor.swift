//
//  KnownFor.swift
//  Movie Application
//
//  Created by Laman Akhundzade on 23.12.22.
//

import Foundation

struct KnownFor: Decodable, Identifiable, Hashable {
    
    let id: Int
    let media_type: String
    let name: String
    let popularity: Double
    
    

}

