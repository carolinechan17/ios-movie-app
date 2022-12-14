//
//  ListView.swift
//  movie-app
//
//  Created by Caroline Chan on 21/08/22.
//

import SwiftUI

struct ListView: View {
    let imageURL: String
    let title: String
    let year: String
    let rating: String
    let crew: String
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: "\(imageURL)")){image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
            } placeholder: {
                Color.gray
            }
            .frame(width: 120, height: 160)
            
            VStack(alignment: .leading) {
                Text("\(title)")
                    .fontWeight(.bold)
                    .font(.system(size: 22))
                    .padding(.top)
                
                Text("\(year)")
                    .fontWeight(.medium)
                    .font(.system(size: 20))
                
                Text("Rating: \(rating)")
                    .fontWeight(.regular)
                    .font(.system(size: 15))
                
                Spacer()
                
                Text("Crew: \(crew)")
                    .fontWeight(.light)
                    .font(.system(size: 15))
                    .padding(.bottom)
            }
        }
    }
}

struct ActorListView: View {
    let imageURL: String
    let name: String
    let asCharacter: String
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "\(imageURL)")){image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
            } placeholder: {
                Color.clear
            }
            .frame(width: 120, height: 160)
            
            Text("\(name)")
                .lineLimit(nil)
                .font(.system(size: 13, weight: .medium))
            
            Text("as \(asCharacter)")
                .lineLimit(nil)
                .font(.system(size: 11))
                .padding(.bottom)
                
        }
    }
}

struct SimilarListView: View {
    let imageURL: String
    let name: String
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "\(imageURL)")){image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
            } placeholder: {
                Color.clear
            }
            .frame(width: 160, height: 200)
            
            Text("\(name)")
                .lineLimit(nil)
                .font(.system(size: 13, weight: .medium))
                .padding(.bottom)
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(imageURL: "https://twitter.com/google", title: "Google", year: "2002", rating: "2.0", crew: "testtest")
    }
}
