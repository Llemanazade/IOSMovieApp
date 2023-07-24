//
//  MovieListState.swift
//  Movie Application
//
//  Created by Laman Akhundzade on 22.12.22.
//


import SwiftUI

class MovieListState: ObservableObject {
    
    @Published var topMovies = [Movie]()
    @Published var popularMovies = [Movie]()

    @Published var isLoading: Bool = false
    @Published var error: NSError?

    private let movieService: MovieService
    
    var currentPage: Int = 1
    var totalPages: Int = 1
    
    init(movieService: MovieService = MovieStore.shared) {
        self.movieService = movieService
    }
    
    func loadMovies(with endpoint: MovieListEndpoint) {
        self.isLoading = true
        
        self.movieService.fetchMovies(from: endpoint, page: String(self.currentPage)) { [weak self] (result) in
            guard let self = self else { return }
            self.isLoading = false
            switch result {
            case .success(let response):

                self.totalPages = response.totalPages
                switch endpoint {
                case .topRated:
                    self.topMovies.append(contentsOf: response.results)
                case .popular:
                    self.popularMovies.append(contentsOf: response.results)

                }
                self.currentPage += 1
                
            case .failure(let error):
                self.error = error as NSError
            }
        }
    }
    
}
