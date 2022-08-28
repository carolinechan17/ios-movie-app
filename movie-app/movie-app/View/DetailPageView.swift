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
                    }
                }
                
                Text("Actors")
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                    .frame(alignment: .leading)
                
                //MARK: Show actor list
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(api.detail.actorList, id: \.id){ actor in
                            HListView(imageURL: actor.image, name: actor.name, asCharacter: actor.asCharacter)
                        }
                    }
                }
                .background(Color("WhiteColor"))
                .cornerRadius(20)
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
