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
            HStack {
                AsyncImage(url: URL(string: "\(movie.image)")){image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .padding()
                } placeholder: {
                    Color.gray
                }
                .frame(width: 120, height: 160)
                
                VStack(alignment: .leading) {
                    Text("\(movie.title)")
                        .fontWeight(.bold)
                        .font(.system(size: 22))
                    
                    Text("\(movie.year)")
                        .fontWeight(.medium)
                        .font(.system(size: 20))
                    
                    Text("Rating: \(movie.imDbRating)")
                        .fontWeight(.regular)
                        .font(.system(size: 15))
                    
                    Spacer()
                    
                    Text("Crew: \(movie.crew)")
                        .fontWeight(.light)
                        .font(.system(size: 15))
                }
            }
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
