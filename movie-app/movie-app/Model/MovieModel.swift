//
//  MovieModel.swift
//  movie-app
//
//  Created by Caroline Chan on 19/08/22.
//
import Foundation

struct Movies: Decodable {
    let items: [MovieEntry]
}

struct MovieEntry: Decodable, Identifiable {
    let id: String
    let rank: String
    let rankUpDown: String
    let title: String
    let fullTitle: String
    let year: String
    let image: String
    let crew: String
    let imDbRating: String
    let imDbRatingCount: String
}

class Api : ObservableObject{
    @Published var movies: [MovieEntry] = []
    
    func loadData() {
        //MARK: URL to get the data
        guard let url = URL(string: "https://imdb-api.com/en/API/MostPopularMovies/k_9p5boe6v") else { fatalError("Missing URL") }
        let urlRequest = URLRequest(url: url)
        
        //MARK: Fetch the data
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }
            
            guard let response = response as? HTTPURLResponse else { return }
            
            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedData = try JSONDecoder().decode(Movies.self, from: data)
                        self.movies = decodedData.items
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }
        dataTask.resume()
    }
}
