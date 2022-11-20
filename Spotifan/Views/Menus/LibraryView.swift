//
//  LibraryView.swift
//  Spotifan
//
//  Created by Muhammad Arfan on 16/11/22.
//

import SwiftUI

struct LibraryView: View {
    
    var libraryColumnsLayout : [GridItem] {
        return Array(repeating: .init(.flexible()), count: 2)
    }
    
    let songs = [
        Song(title: "Song Title", album: "Song Album", thumbnail_string_url: nil),
        Song(title: "Song Title", album: "Song Album", thumbnail_string_url: nil),
        Song(title: "Song Title", album: "Song Album", thumbnail_string_url: nil),
        Song(title: "Song Title", album: "Song Album", thumbnail_string_url: nil),
        
        Song(title: "Song Title", album: "Song Album", thumbnail_string_url: nil),
        Song(title: "Song Title", album: "Song Album", thumbnail_string_url: nil),
        Song(title: "Song Title", album: "Song Album", thumbnail_string_url: nil),
        Song(title: "Song Title", album: "Song Album", thumbnail_string_url: nil),
        
        Song(title: "Song Title", album: "Song Album", thumbnail_string_url: nil),
        Song(title: "Song Title", album: "Song Album", thumbnail_string_url: nil),
        Song(title: "Song Title", album: "Song Album", thumbnail_string_url: nil),
        Song(title: "Song Title", album: "Song Album", thumbnail_string_url: nil),
        
        Song(title: "Song Title", album: "Song Album", thumbnail_string_url: nil),
        Song(title: "Song Title", album: "Song Album", thumbnail_string_url: nil),
        Song(title: "Song Title", album: "Song Album", thumbnail_string_url: nil),
        Song(title: "Song Title", album: "Song Album", thumbnail_string_url: nil),
    ];
    
    var body: some View {
        LibraryNavbar {
            self.content
        }
    }
    
    
    var content : some View {
        LazyVStack{
            HStack{
                Button {
                    
                } label: {
                    HStack(spacing: 8){
                        Image(systemName: "arrow.left.arrow.right")
                            .rotationEffect(.degrees(90))
                        
                        Text("Most recent")
                            .foregroundColor(.UI.white)
                    }
                    .font(.caption)
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "square.grid.2x2")
                        .font(.body)
                }
                
            }
            .foregroundColor(.UI.white)
            .fontWeight(.semibold)
            .padding(.vertical,10 )
            
            LibraryListOrGrid(
                style: .constant(.list),
                songs: self.songs
            )
        }
        .padding(.horizontal)
        .background(Color.UI.black)
    }
    
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
