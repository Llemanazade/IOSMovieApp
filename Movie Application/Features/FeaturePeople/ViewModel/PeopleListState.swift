//
//  PeopleListView.swift
//  Movie Application
//
//  Created by Laman Akhundzade on 23.12.22.
//


import SwiftUI

class PeopleListState: ObservableObject {
    
    @Published var trendingPeople = [People]()
    @Published var popularPeople = [People]()
    @Published var isLoading: Bool = false
    @Published var error: NSError?

    private let peopleService: PeopleService
    
    var currentPage: Int = 1
    var totalPages: Int = 1
    
    init(peopleService: PeopleService = PeopleStore.shared) {
        self.peopleService = peopleService
    }
    
    func loadPeople(with endpoint: PeopleEndPoint) {
        self.isLoading = true
        self.peopleService.fetchPeople(from: endpoint, page: String(self.currentPage)) { [weak self] (result) in
            guard let self = self else { return }
            self.isLoading = false
            switch result {
            case .success(let response):
                self.totalPages = response.totalPages
                switch endpoint {
                case .trending:
                    self.trendingPeople.append(contentsOf: response.results)
                case .popular:
                    self.popularPeople.append(contentsOf: response.results)

                }
                self.currentPage += 1
                
            case .failure(let error):
                self.error = error as NSError
            }
        }
    }
    
}
