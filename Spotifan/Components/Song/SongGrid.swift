//
//  SongGrid.swift
//  Spotifan
//
//  Created by Muhammad Arfan on 03/11/22.
//

import SwiftUI

struct SongGrid: View {
	private let gridItemLayout = Array(repeating: GridItem(.flexible(), spacing: 10), count: 2)
	
	@State var songs : [Song] = [] ;
	
	var body: some View {
		LazyVGrid(columns: self.gridItemLayout , spacing: 10) {
			ForEach(self.songs) { song in
				GeometryReader { geo in
					HStack{
						Image("image_test")
							.resizable()
							.aspectRatio(contentMode: .fill)
							.frame(width: geo.size.height , height: geo.size.height, alignment: .center)
							.clipped()
						
						Text("\(song.title)")
							.font(.caption.bold())
							.foregroundColor(.UI.grey)
					}
				}
				.frame(height: 50)
				.background(Color.UI.darkGrey)
			}
		}
		
	}
}

struct SongGrid_Previews: PreviewProvider {
	static var previews: some View {
		SongGrid(songs: [
			Song(title: "Test Title", album: "Test Album", thumbnail_string_url: "https"),
			Song(title: "Test Title", album: "Test Album", thumbnail_string_url: "https"),
			Song(title: "Test Title", album: "Test Album", thumbnail_string_url: "https"),
			Song(title: "Test Title", album: "Test Album", thumbnail_string_url: "https"),
			Song(title: "Test Title", album: "Test Album", thumbnail_string_url: "https"),
			Song(title: "Test Title", album: "Test Album", thumbnail_string_url: "https")
		])
		.padding(.horizontal)
	}
}
