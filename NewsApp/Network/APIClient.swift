import Foundation

class APIClient {
    static let shared = APIClient()
    private let apiKey = "b9f40b5172cc4f94bd07f6b26d85c5b8"
    private let baseURL = "https://newsapi.org/v2/"

    func fetchCategories(completion: @escaping (Result<[Category], Error>) -> Void) {
        let url = URL(string: "\(baseURL)sources?apiKey=\(apiKey)")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: nil)))
                return
            }
            do {
                let result = try JSONDecoder().decode(CategoryResponse.self, from: data)
                completion(.success(result.sources))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }

    func fetchSources(for category: String, completion: @escaping (Result<[Source], Error>) -> Void) {
        let url = URL(string: "\(baseURL)sources?category=\(category)&apiKey=\(apiKey)")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: nil)))
                return
            }
            do {
                let result = try JSONDecoder().decode(SourceResponse.self, from: data)
                completion(.success(result.sources))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }

    func fetchArticles(for source: String, completion: @escaping (Result<[Article], Error>) -> Void) {
        let url = URL(string: "\(baseURL)top-headlines?sources=\(source)&apiKey=\(apiKey)")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: nil)))
                return
            }
            do {
                let result = try JSONDecoder().decode(ArticleResponse.self, from: data)
                completion(.success(result.articles))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

struct CategoryResponse: Codable {
    let sources: [Category]
}

struct SourceResponse: Codable {
    let sources: [Source]
}

struct ArticleResponse: Codable {
    let articles: [Article]
}
