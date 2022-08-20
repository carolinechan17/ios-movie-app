//
//  movie_appApp.swift
//  movie-app
//
//  Created by Caroline Chan on 18/08/22.
//

import SwiftUI

@main
struct movie_appApp: App {
    var api = Api()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(api)
        }
    }
}
