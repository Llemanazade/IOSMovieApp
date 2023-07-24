//
//  PeopleService.swift
//  Movie Application
//
//  Created by Laman Akhundzade on 23.12.22.
//

import Foundation

protocol PeopleService{
    
    func fetchPeople(from endpoint: PeopleEndPoint, page: String, completion: @escaping (Result<PeopleResponse, ErrorResponse>) -> ())
    func fetchPerson(id: Int, completion: @escaping (Result<People, ErrorResponse>) -> ())
}

enum PeopleEndPoint: String, CaseIterable, Identifiable {
    
    var id: String { rawValue }
    
    case trending = "trending/person/day"
    case popular = "person/popular"
    
    var description: String {
        switch self {
        case .trending: return "Trending"
        case .popular: return "Popular"
        }
    }
    
}


