//
//  SerieService.swift
//  Movie Application
//
//  Created by Laman Akhundzade on 23.12.22.
//

import Foundation


protocol SerieService {
    
    func fetchSeries(from endpoint: SerieListEndpoint, page: String, completion: @escaping (Result<SerieResponse, ErrorResponse>) -> ())
    func fetchSerie(id: Int, completion: @escaping (Result<Serie, ErrorResponse>) -> ())
    //    func searchSerie(query: String, completion: @escaping (Result<SerieResponse, ErrorResponse>) -> ())
}

enum SerieListEndpoint: String, CaseIterable, Identifiable {
    
    var id: String { rawValue }
    
    case topRated = "top_rated"
    case popular 
    
    var description: String {
        switch self {
        case .topRated: return "Top Rated"
        case .popular: return "Popular"
        }
    }
}

