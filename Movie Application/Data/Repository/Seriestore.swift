//
//  Seriestore.swift
//  Movie Application
//
//  Created by Laman Akhundzade on 23.12.22.
//

import Foundation


class SerieStore: SerieService {
    
    
    
    static let shared = SerieStore()
    private init() {}
    
    
    func fetchSeries(from endpoint: SerieListEndpoint, page: String = "1", completion: @escaping (Result<SerieResponse, ErrorResponse>) -> ()) {
        guard let url = URL(string: "\(Constants.baseAPIURL)/tv/\(endpoint.rawValue)") else {
            completion(.failure(.invalidEndpoint))
            return
        }
        self.loadURLAndDecode(url: url, params: [
            "page": page
        ], completion: completion)
    }
    
    func fetchSerie(id: Int, completion: @escaping (Result<Serie, ErrorResponse>) -> ()) {
        guard let url = URL(string: "\(Constants.baseAPIURL)/tv/\(id)") else {
            completion(.failure(.invalidEndpoint))
            return
        }
        self.loadURLAndDecode(url: url, params: [
            "append_to_response": "videos,credits"
        ], completion: completion)
    }
    
    private func loadURLAndDecode<D: Decodable>(url: URL, params: [String: String]? = nil, completion: @escaping (Result<D, ErrorResponse>) -> ()) {
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            completion(.failure(.invalidEndpoint))
            return
        }
        
        var queryItems = [URLQueryItem(name: "api_key", value: Constants.apiKey)]
        if let params = params {
            queryItems.append(contentsOf: params.map { URLQueryItem(name: $0.key, value: $0.value) })
        }
        
        urlComponents.queryItems = queryItems
        
        guard let finalURL = urlComponents.url else {
            completion(.failure(.invalidEndpoint))
            return
        }
        
        Constants.urlSession.dataTask(with: finalURL) { [weak self] (data, response, error) in
            guard let self = self else { return }
            
            if error != nil {
                self.executeCompletionHandlerInMainThread(with: .failure(.apiError), completion: completion)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                self.executeCompletionHandlerInMainThread(with: .failure(.invalidResponse), completion: completion)
                return
            }
            
            guard let data = data else {
                self.executeCompletionHandlerInMainThread(with: .failure(.noData), completion: completion)
                return
            }
            
            do {
                let decodedResponse = try Constants.jsonDecoder.decode(D.self, from: data)
                self.executeCompletionHandlerInMainThread(with: .success(decodedResponse), completion: completion)
            } catch {
                self.executeCompletionHandlerInMainThread(with: .failure(.serializationError), completion: completion)
            }
        }.resume()
    }
    
    private func executeCompletionHandlerInMainThread<D: Decodable>(with result: Result<D, ErrorResponse>, completion: @escaping (Result<D, ErrorResponse>) -> ()) {
        DispatchQueue.main.async {
            completion(result)
        }
    }
}
