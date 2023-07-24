//
//  PersonDetailsState.swift
//  Movie Application
//
//  Created by Laman Akhundzade on 23.12.22.
//

import Foundation

class PersonDetailsState: ObservableObject {
    private let peopleService: PeopleService
    @Published var person: People?
    @Published var isLoading = false
    @Published var error: NSError?
    
    init(personService: PeopleService = PeopleStore.shared) {
        self.peopleService = personService
    }
    
    func loadPerson(id: Int) {
        self.person = nil
        self.isLoading = false
        self.peopleService.fetchPerson(id: id) {[weak self] (result) in
            guard let self = self else { return }
            
            self.isLoading = false
            switch result {
            case .success(let person):
                self.person = person
            case .failure(let error):
                self.error = error as NSError
            }
        }
    }
}
