//
//  DetailPageView.swift
//  movie-app
//
//  Created by Caroline Chan on 22/08/22.
//

import SwiftUI

struct DetailPageView: View {
    let id: String
    @EnvironmentObject var api: Api
    
    var body: some View {
        ScrollView {
            VStack {
                //MARK: Show movie poster and synopsis
                HStack {
                    AsyncImage(url: URL(string: "\(api.detail.image)")){image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .padding()
                    } placeholder: {
                        Color.clear
                    }
                    .frame(width: 160, height: 200)
                    
                    VStack(alignment: .leading) {
                        Text("Synopsis")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                        
                        Text(api.detail.plot)
                            .font(.system(size: 15))
                            .fontWeight(.regular)
                            .padding(.trailing)
                        
                        Spacer()
                        
                        Text("Genre(s): \(api.detail.genres)")
                            .font(.system(size: 15))
                            .fontWeight(.regular)
                            .padding(.trailing)
                    }
                }
                
                Divider()
                
                HStack{
                    Text("Actors")
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                        .padding(.leading)
                    
                    Spacer()
                }
                
                //MARK: Show actor list
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(api.detail.actorList, id: \.id){ actor in
                            HListView(imageURL: actor.image, name: actor.name, asCharacter: actor.asCharacter)
                        }
                    }
                }
                .background(Color("WhiteColor"))
            }
            .onAppear() {
                api.loadDetail(id)
            }
        }
    }
}

struct DetailPageView_Previews: PreviewProvider {
    static var previews: some View {
        DetailPageView(id: "tt1375666")
    }
}
