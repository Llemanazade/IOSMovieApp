//
//  SerieListState.swift
//  Movie Application
//
//  Created by Laman Akhundzade on 23.12.22.
//


import SwiftUI

class SerieListState: ObservableObject {
    
    @Published var topSeries = [Serie]()
    @Published var popularSeries = [Serie]()
    @Published var isLoading: Bool = false
    @Published var error: NSError?
    
    private let serieService: SerieService
    
    var currentPage: Int = 1
    var totalPages: Int = 1
    
    init(serieService: SerieService = SerieStore.shared) {
        self.serieService = serieService
    }
    
    func loadSeries(with endpoint: SerieListEndpoint) {
        self.isLoading = true
        self.serieService.fetchSeries(from: endpoint, page: String(self.currentPage)) { [weak self] (result) in
            guard let self = self else { return }
            self.isLoading = false
            switch result {
            case .success(let response):
                self.totalPages = response.totalPages
                switch endpoint {
                case .topRated:
                    self.topSeries.append(contentsOf: response.results)
                case .popular:
                    self.popularSeries.append(contentsOf: response.results)
                }
                self.currentPage += 1
                case .failure(let error):
                    self.error = error as NSError
                    print(error)
                }
            }
        }
        
    }
    

