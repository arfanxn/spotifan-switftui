//
//  ExploreView.swift
//  Spotifan
//
//  Created by Muhammad Arfan on 16/11/22.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        ExploreNavbar(content: self.content)
    }
    
    var content : AnyView { .init(
        LazyVStack(content: {
            Text("Browse All")
                .font(.title3.bold())
                .padding(.top)
            
            SongCategoryGrid(categories: [
                SongCategory(name: "Pop & Funk"),
                SongCategory(name: "Pop & Funk"),
                SongCategory(name: "Pop & Funk"),
                SongCategory(name: "Pop & Funk"),
                
                SongCategory(name: "Pop & Funk"),
                SongCategory(name: "Pop & Funk"),
                SongCategory(name: "Pop & Funk"),
                SongCategory(name: "Pop & Funk"),
                
                SongCategory(name: "Pop & Funk"),
                SongCategory(name: "Pop & Funk"),
                SongCategory(name: "Pop & Funk"),
                SongCategory(name: "Pop & Funk"),
                
                SongCategory(name: "Pop & Funk"),
                SongCategory(name: "Pop & Funk"),
                SongCategory(name: "Pop & Funk"),
                SongCategory(name: "Pop & Funk"),
                
                SongCategory(name: "Pop & Funk"),
                SongCategory(name: "Pop & Funk"),
                SongCategory(name: "Pop & Funk"),
                SongCategory(name: "Pop & Funk"),
                
                SongCategory(name: "Pop & Funk"),
                SongCategory(name: "Pop & Funk"),
                SongCategory(name: "Pop & Funk"),
                SongCategory(name: "Pop & Funk"),
                
                SongCategory(name: "Pop & Funk"),
                SongCategory(name: "Pop & Funk"),
                SongCategory(name: "Pop & Funk"),
                SongCategory(name: "Pop & Funk"),
                
                SongCategory(name: "Pop & Funk"),
                SongCategory(name: "Pop & Funk"),
                SongCategory(name: "Pop & Funk"),
                SongCategory(name: "Pop & Funk"),
                
                SongCategory(name: "Pop & Funk"),
                SongCategory(name: "Pop & Funk"),
                SongCategory(name: "Pop & Funk"),
                SongCategory(name: "Pop & Funk"),
            ])
        })
        .padding(.horizontal)
    )}
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
