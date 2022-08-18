//
//  HomeView.swift
//  movie-app
//
//  Created by Caroline Chan on 18/08/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        Button(action: {}) {
            HStack {
                Image(systemName: "film")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(Color.white)
                    
                Text("Movie App")
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
            }
            .padding()
            .background(Color("Blue2Color"))
            .cornerRadius(20)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
