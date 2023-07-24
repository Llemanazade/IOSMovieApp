//
//  SerieDetailState.swift
//  Movie Application
//
//  Created by Laman Akhundzade on 23.12.22.
//

import SwiftUI

class SerieDetailState: ObservableObject {
    
    private let serieService: SerieService
    @Published var serie: Serie?
    @Published var isLoading = false
    @Published var error: NSError?
    
    init(serieSrvice: SerieService = SerieStore.shared) {
        self.serieService = serieSrvice
    }
    
    func loadSerie(id: Int) {
        self.serie = nil
        self.isLoading = false
        self.serieService.fetchSerie(id: id) {[weak self] (result) in
            guard let self = self else { return }
            
            self.isLoading = false
            switch result {
            case .success(let serie):
                self.serie = serie
            case .failure(let error):
                self.error = error as NSError
            }
        }
    }
}
