//
//  MovieModel.swift
//  movie-app
//
//  Created by Caroline Chan on 19/08/22.
//
import Foundation

struct Item: Codable {
    let movies: [MovieEntry]
}

struct MovieEntry: Codable, Identifiable {
    let id: String
    let rank: String
    let rankUpDown: String
    let title: String
    let fullTitle: String
    let year: String
    let image: String
    let crew: String
    let imdbRating: String
    let imdbRatingCount: String
}

class Api : ObservableObject{
    @Published var movies = [MovieEntry]()
    
    func loadData(completion:@escaping ([MovieEntry]) -> ()) {
        guard let url = URL(string: "https://imdb-api.com/en/API/MostPopularMovies/k_9p5boe6v") else {
            print("Invalid url...")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            let movies = try! JSONDecoder().decode([MovieEntry].self, from: data!)
            print(movies)
            DispatchQueue.main.async {
                completion(movies)
            }
        }.resume()
        
    }
}
