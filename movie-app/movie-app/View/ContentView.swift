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
        TabView {
            //MARK: Show movie poster and brief description
            List(api.movies, id: \.id) { movie in
                NavigationLink(destination: DetailPageView(id: movie.id).environmentObject(Api())){
                    ListView(imageURL: movie.image, title: movie.title, year: movie.year, rating: movie.imDbRating, crew: movie.crew)
                }
            }
            .onAppear() {
                api.loadMovieData()
            }
            .tabItem {
                Image(systemName: "film.circle")
                Text("Top Movies")
            }
            .navigationBarHidden(true)
            .navigationTitle("Most Popular Movies")
            .navigationBarTitleDisplayMode(.automatic)
            
            //MARK: Show TV Show poster and brief description
            List(api.tvShows, id: \.id){tvShow in
                NavigationLink(destination: DetailPageView(id: tvShow.id).environmentObject(Api())){
                    ListView(imageURL: tvShow.image, title: tvShow.title, year: tvShow.year, rating: tvShow.imDbRating, crew: tvShow.crew)
                }
            }
            .onAppear() {
                api.loadTVShowData()
            }
            .tabItem {
                Image(systemName: "tv.circle")
                Text("Top TV Shows")
            }
            .navigationBarHidden(true)
            .navigationTitle("Most Popular TV Shows")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
