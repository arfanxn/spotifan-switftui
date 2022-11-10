
//
//  AuthManager.swift
//  Cemotify
//
//  Created by Muhammad Arfan on 03/11/2022.
//
import Foundation
import Request

class SpotifyManager {
	
	static let shared = SpotifyManager()
	
	private let clientID = "29937776ead24f469062776b01c14377";
	private let clientSecret = "065d135e2465451da4d46a5fa943c68e";
	
	func authorize () {
		
		AnyRequest<SpotifyAccessToken> {
			Url("https://accounts.spotify.com/api/token")
			Method(.post)
			Header.Any(key: "Content-Type", value: "application/x-www-form-urlencoded")
			Header.Any(
				key: "Authorization",
				value: "Basic \((clientID+":"+clientSecret).data(using: .utf8)!.base64EncodedString())"
			)
			Query(["grant_type": "client_credentials"])
		}
		.onJson({ json in
			print(json)
		})
		.onObject{ (object : SpotifyAccessToken) in
			if object.token != nil {
				KeychainManager.shared.save(object, service: "access-token", account: "spotify")
			}
		}
		.call()
	}
	
	func refreshToken () {
		if let accessToken = KeychainManager.shared.get(service: "access-token" , account: "spotify", type: SpotifyAccessToken.self)?.token {
			AnyRequest<SpotifyAccessToken> {
				Url("https://accounts.spotify.com/api/token")
				Method(.post)
				Header.Any(key: "Content-Type", value: "application/x-www-form-urlencoded")
				Query(["grant_type": "refresh_token"])
				Query(["refresh_token": accessToken ])
			}
			.onJson({ json in
				print(json)
			})
//			.onObject{ (object : SpotifyAccessToken) in
//				if object.token != nil {
//					KeychainManager.shared.save(object, service: "access-token", account: "spotify")
//				}
//			}
			.call()
		}
	}
	
	func request (url : URL) {
		if let accessToken = KeychainManager.shared.get(service: "access-token", account: "spotify", type: SpotifyAccessToken.self)?.token {
			Request{
				Url(url.absoluteString)
				Method(.get)
				Header.Any(key: "Authorization", value: "Bearer " + accessToken)
			}
			.onJson({ json in
				print(json);
			})
			.onError({ error in
				print(error.localizedDescription)
			})
			.call()
		}
	}
	
}

