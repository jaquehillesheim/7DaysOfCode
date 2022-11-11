//
//  Network.swift
//  Movie
//
//  Created by Jaqueline Hillesheim on 11/11/22.
//

import Foundation

class Network {
    private func getApiKey() -> String? {
        var keys: NSDictionary?
        if let path = Bundle.main.path(forResource: "Info", ofType: "plist") {
            keys = NSDictionary(contentsOfFile: path)
            return keys?["apiKey"] as? String
        }
        return nil
    }
    
    private func getURLPopularMovie() -> String {
        guard let APIKey = getApiKey() else { return String() }
        return "https://api.themoviedb.org/3/movie/popular?api_key=\(APIKey)&language=pt-BR&page=1"
    }
    
    func fetchPopularMovies(_ completion: @escaping ([Movie]) -> ()) {
        let url = URL(string: getURLPopularMovie())!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let result = try decoder.decode(MovieResults.self, from: data)
               
                completion(result.results)
            } catch {
                print("Não foi possível decodificar o JSON")
            }
        }
        task.resume()
    }
}
