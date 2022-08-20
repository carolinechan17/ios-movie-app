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
            Text("\(movie.fullTitle)")
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
