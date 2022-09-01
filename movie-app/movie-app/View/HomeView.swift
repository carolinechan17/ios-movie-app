//
//  HomeView.swift
//  movie-app
//
//  Created by Caroline Chan on 18/08/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ZStack{
                Color.white.edgesIgnoringSafeArea(.all)
                VStack{
                    HStack {
                        Image(systemName: "film")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .foregroundColor(Color.accentColor)
                    }
                    .padding()
                    
                    NavigationLink(destination: ContentView().environmentObject(Api())) {
                        HStack {
                            Text("See more")
                                .foregroundColor(Color.accentColor)
                                .font(.system(size: 25, weight: .medium))
                                .padding(.trailing, 0)
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color.accentColor)
                                .font(.system(size: 25, weight: .medium))
                        }
                        .frame(width: 150, height: 40, alignment: .center)
                    }
                    
                    Spacer()
                    
                    Text("iOS Movie App")
                        .fontWeight(.bold)
                        .font(.system(size: 25))
                        .foregroundColor(Color.accentColor)
                        .padding(.bottom, 40)
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
