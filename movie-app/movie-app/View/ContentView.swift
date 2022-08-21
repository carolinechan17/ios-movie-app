//
//  ContentView.swift
//  movie-app
//
//  Created by Caroline Chan on 18/08/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var api: Api

    var body: some View {
        List(api.movies, id: \.id) { movie in
            ListView(imageURL: movie.image, title: movie.title, year: movie.year, rating: movie.imDbRating, crew: movie.crew)
        }
        .onAppear() {
            api.loadData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
