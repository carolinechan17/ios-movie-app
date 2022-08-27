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
        Text(api.detail.title)
        .onAppear() {
            api.loadDetail(id)
        }
    }
}

struct DetailPageView_Previews: PreviewProvider {
    static var previews: some View {
        DetailPageView(id: "tt1375666")
    }
}
