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

struct HListView: View {
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
                .font(.system(size: 13))
                .fontWeight(.medium)
                .frame(width: 100, height: 13, alignment: .center)
            
            Text("as \(asCharacter)")
                .font(.system(size: 11))
                .fontWeight(.light)
                .frame(width: 100, height: 15, alignment: .center)
                .padding(.bottom, 20)
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(imageURL: "https://twitter.com/google", title: "Google", year: "2002", rating: "2.0", crew: "testtest")
    }
}
