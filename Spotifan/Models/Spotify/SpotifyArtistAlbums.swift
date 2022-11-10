//
//  SpotifyArtistAlbums.swift
//  Spotifan
//
//  Created by Muhammad Arfan on 06/11/22.
//

import Foundation

class SpotifyArtistAlbums : Decodable , Hashable {
	static func == (lhs: SpotifyArtistAlbums, rhs: SpotifyArtistAlbums) -> Bool {
		return lhs.items?.count == rhs.items?.count ;
	}
	func hash(into hasher: inout Hasher) {
		hasher.combine(items)
	}
	
	let items : [SpotifyArtistAlbums.Item]?
	
	struct Item : Decodable, Identifiable, Hashable {
		static func == (lhs: SpotifyArtistAlbums.Item, rhs: SpotifyArtistAlbums.Item) -> Bool {
			return lhs.id == rhs.id ;
		}
//		func hash(into hasher: inout Hasher) {
//			hasher.combine(self.id)
//		}
		
		let id = UUID()
		let albumType: String?
		let name: String?
		let releaseDate: String?
//		let artists: [Artist]?
//		let images: [AlbumImage]?
//		let externalUrls: ExternalUrls?
		let totalTracks: Int?
		
		enum CodingKeys: String, CodingKey {
//			case artists;
//			case images;
			case name;
			case albumType = "album_type"
			case releaseDate = "release_date"
//			case externalUrls = "external_urls"
			case totalTracks = "total_tracks"
		}
	}
}
