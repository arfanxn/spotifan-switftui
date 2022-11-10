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
		//		GeometryReader{ proxy in
		//			LazyVGrid(columns: self.gridItemLayout) {
		//				ForEach(self.songs) { song in
		//					HStack{
		//						Image(systemName: "fire.fill")
		//							.frame(width: proxy.size.width , height: proxy.size.height)
		//
		//						Text("Hello world")
		//					}
		//				}
		//			}
		//		}
		//		.frame(width: 400, height: 400)
		
//		LazyVGrid(columns: self.gridItemLayout , spacing: 20) {
//			ForEach(self.songs) { song in
//				GeometryReader { geo in
//					HStack{
//						Image("image_test")
//							.resizable()
//						//							.frame(width: 50, height: 50)
//							.padding(0)
//							.frame(width: geo.size.height, height: geo.size.height)
//							.background(Color.red)
//
//						//						Text(song.title)
//						Text("\(geo.size.width)")
//					}
//					.padding(0)
//					.background(Color.UI.primary)
//					.padding(.vertical, 0)
//					.padding(.trailing, 20)
//				}
//
//			}
//		}
		
//		LazyVGrid(columns: self.gridItemLayout , spacing: 10) {
//			ForEach(self.songs) { song in
//				GeometryReader { geo in
//					HStack{
//						Color.clear
//							.overlay (
//								Image("image_test")
//									.resizable()
//									.aspectRatio(contentMode: .fill)
//									.frame(width: geo.size.height , height: geo.size.height, alignment: .center)
//									.clipped()
//							)
//							.clipped()
//
//						Text("Song Title")
//							.font(.caption.bold())
//					}
//				}
//				.frame(height: 50)
//				.background(Color.UI.background)
//			}
//		}
		
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
					}
				}
				.frame(height: 50)
				.background(Color.UI.background)
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
