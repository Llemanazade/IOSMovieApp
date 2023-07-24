//
//  MovieService.swift
//  Movie Application
//
//  Created by Laman Akhundzade on 22.12.22.
//

import Foundation

protocol MovieService {
    
    func fetchMovies(from endpoint: MovieListEndpoint, page: String, completion: @escaping (Result<MovieResponse, ErrorResponse>) -> ())
    func fetchMovie(id: Int, completion: @escaping (Result<Movie, ErrorResponse>) -> ())
    //    func searchMovie(query: String, completion: @escaping (Result<MovieResponse, MovieError>) -> ())
}

enum MovieListEndpoint: String, CaseIterable, Identifiable {
    
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

