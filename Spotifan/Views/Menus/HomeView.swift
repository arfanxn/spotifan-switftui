//
//  HomeView.swift
//  Spotifan
//
//  Created by Muhammad Arfan on 01/11/22.
//

import SwiftUI

struct HomeView: View {
    
    let songs = [
        Song(title: "Song Titile", album: "Song Album", thumbnail_string_url: nil),
        Song(title: "Song Titile", album: "Song Album", thumbnail_string_url: nil),
        Song(title: "Song Titile", album: "Song Album", thumbnail_string_url: nil),
        Song(title: "Song Titile", album: "Song Album", thumbnail_string_url: nil),
        Song(title: "Song Titile", album: "Song Album", thumbnail_string_url: nil),
        Song(title: "Song Titile", album: "Song Album", thumbnail_string_url: nil),
    ];
    
    var body: some View {
        HomeNavbar {
            self.content
        }
    }
    
    var content : some View {
        LazyVStack(spacing:20){
            SongGrid(songs : self.songs)
            
            ForEach(1..<3) { index in
                SongCarousel(title: "Song Carousel Title \(index)", style: .reguler, songs: self.songs)
                SongCarousel(title: "Song Carousel Title \(index)", style: .small, songs: self.songs)
                SongCarousel(title: "Song Carousel Title \(index)", style: .smallRounded, songs: self.songs)
                SongCarousel(title: "Song Carousel Title \(index)", style: .regulerRounded, songs: self.songs)
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
