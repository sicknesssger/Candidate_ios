import Foundation
import Combine

class ProductViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var searchText: String = ""
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    private var cancellables = Set<AnyCancellable>()
    
    func searchProducts() {
        guard !searchText.isEmpty else { return }
        isLoading = true
        errorMessage = nil
        
        let urlString = "https://api.mercadolibre.com/sites/MLA/search?q=\(searchText)"
        guard let url = URL(string: urlString) else {
            self.errorMessage = "Invalid URL"
            self.isLoading = false
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: SearchResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                self.isLoading = false
                if case .failure(let error) = completion {
                    self.errorMessage = error.localizedDescription
                }
            }, receiveValue: { response in
                self.products = response.results
            })
            .store(in: &self.cancellables)
    }
}

struct SearchResponse: Codable {
    let results: [Product]
}
