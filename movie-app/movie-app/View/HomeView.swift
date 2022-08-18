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
                Color("WhiteColor").edgesIgnoringSafeArea(.all)
                VStack{
                    NavigationLink(destination: ContentView()) {
                            HStack {
                                Image(systemName: "film")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .foregroundColor(Color.white)
                            }
                            .padding()
                            .background(Color("Blue1Color"))
                            .cornerRadius(20)
                    }
                    
                    Spacer()
                    
                    Text("iOS Movie App")
                        .fontWeight(.bold)
                        .font(.system(size: 25))
                        .foregroundColor(Color("Blue2Color"))
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
