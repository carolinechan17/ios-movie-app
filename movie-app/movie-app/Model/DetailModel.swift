//
//  DetailModel.swift
//  movie-app
//
//  Created by Caroline Chan on 22/08/22.
//

import Foundation

struct Details: Decodable {
    var id: String = ""
    var title: String = ""
    var originalTitle: String = ""
    var fullTitle: String = ""
    var type: String = ""
    var year: String = ""
    var image: String = ""
    var releaseDate: String = ""
    var runtimeMins: String? = nil
    var runtimeStr: String? = nil
    var plot: String = ""
    var plotLocal: String = ""
    var plotLocalIsRtl: Bool = false
    var awards: String = ""
    var directors: String = ""
    var directorList: [Entry] = []
    var writers: String = ""
    var writerList: [Entry] = []
    var stars: String = ""
    var starList: [Entry] = []
    var actorList: [Actor] = []
    var fullCast: String? = nil
    var genres: String = ""
    var genreList: [Entry2] = []
    var companies: String = ""
    var companyList: [Entry] = []
    var countries: String = ""
    var countryList: [Entry2] = []
    var languages: String = ""
    var languageList: [Entry2] = []
    var contentRating: String = ""
    var imDbRating: String = ""
    var imDbRatingVotes: String = ""
    var metacriticRating: String? = nil
    var ratings: String? = nil
    var wikipedia: String? = nil
    var posters: String? = nil
    var images: String? = nil
    var trailer: String? = nil
    var boxOffice: [String: String] = [:]
    var tagline: String? = nil
    var keywords: String = ""
    var keywordList: [String] = []
    var similars: [Similar] = []
    var tvSeriesInfo: TVSeriesInfo? = nil
    var tvEpisodeInfo: String? = nil
    var errorMessage: String? = nil
}

//MARK: Struct for directorList, writerList, starList, companyList, creatorList
struct Entry: Decodable {
    let id: String
    let name: String
}

//MARK: Struct for actorList
struct Actor: Decodable {
    let id: String
    let image: String
    let name: String
    let asCharacter: String
}

//MARK: Struct for genreList, countryList, languageList
struct Entry2: Decodable {
    let key: String
    let value: String
}

//MARK: Struct for similars
struct Similar: Decodable {
    let id: String
    let title: String
    let image: String
    let imDbRating: String
}

//MARK: Struct for tv series info
struct TVSeriesInfo: Decodable {
    let yearEnd: String
    let creators: String
    let creatorList: [Entry]
    let seasons: [String]
}

extension Api {
    //MARK: Function to load details from api
    func loadDetail(_ id: String) {
        //MARK: URL to get the data
        guard let url = URL(string: "https://imdb-api.com/en/API/Title/k_9p5boe6v/\(id)") else { fatalError("Missing URL") }
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
                        let decodedData = try JSONDecoder().decode(Details.self, from: data)
                        self.detail = decodedData
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }
        dataTask.resume()
    }
}
