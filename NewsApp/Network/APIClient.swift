import Foundation

class APIClient {
    static let shared = APIClient()
    private let apiKey = "29edbce654bd4a438195ba835c4e5636"
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
            let urlString = "\(baseURL)sources?category=\(category)&apiKey=\(apiKey)"
            guard let url = URL(string: urlString) else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
                return
            }

           /* print("Fetching sources from URL: \(urlString)")*/  // Debug print

            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                   /* print("Error fetching sources: \(error.localizedDescription)")*/  // Debug print
                    completion(.failure(error))
                    return
                }

                guard let data = data else {
                   /* print("No data received from the API")*/  // Debug print
                    completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                    return
                }

                do {
                    let response = try JSONDecoder().decode(SourceResponse.self, from: data)
                    /*print("Fetched sources: \(response.sources)")*/  // Debug print
                    completion(.success(response.sources))
                } catch {
                   /* print("Error decoding response: \(error.localizedDescription)") */ // Debug print
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
