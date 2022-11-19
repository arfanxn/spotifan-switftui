//
//  HomeView.swift
//  Spotifan
//
//  Created by Muhammad Arfan on 01/11/22.
//

import SwiftUI

struct HomeView: View {
    
    let songs = [
        Song(title: "Hello", album: "World", thumbnail_string_url: nil),
        Song(title: "Hello", album: "World", thumbnail_string_url: nil),
        Song(title: "Hello", album: "World", thumbnail_string_url: nil),
        Song(title: "Hello", album: "World", thumbnail_string_url: nil),
        Song(title: "Hello", album: "World", thumbnail_string_url: nil),
        Song(title: "Hello", album: "World", thumbnail_string_url: nil),
    ];
    
    var body: some View {
        HomeNavbar {
            self.content
        }
    }
    
    var content : some View {
        LazyVStack(spacing:20){
            SongGrid(songs : self.songs)
            
            ForEach(1..<10) { index in 
                SongCarousel(title: "Song \(index)", style: .reguler)
            }
            
        }
        .padding(.horizontal)
        .background(Color.UI.black)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                HomeView()
            }
        }
    }
}
