//
//  SpotifyAPI.swift
//  Spotifan
//
//  Created by Muhammad Arfan on 07/11/22.
//

import Foundation

struct SpotifyAPI {

	private static var components : URLComponents {
		var components = URLComponents() ;
		components.scheme = "https"
		components.host = "api.spotify.com"
		components.path = "/v1"
		return components ;
	}
	
	public static func search (keyword : String) -> URLComponents {
		var components = self.components ;
		components.path += "/search"
		components.queryItems = [
			.init(name: "q", value: keyword),
			.init(name: "type", value: "track"),
			.init(name: "include_external", value: "audio"),
		]
		return components;
	}
}

