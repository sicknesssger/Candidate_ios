//
//  ApiService.swift
//  Chanllengetecnico
//
//  Created by Gerardo Enrique Mendez Raigoso on 5/08/24.
//

import Foundation
import Foundation
import Combine

struct ApiService {
    static func searchProducts(query: String) -> AnyPublisher<SearchResponse, Error> {
        let urlString = "https://api.mercadolibre.com/sites/MLA/search?q=\(query)"
        guard let url = URL(string: urlString) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }

        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: SearchResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
