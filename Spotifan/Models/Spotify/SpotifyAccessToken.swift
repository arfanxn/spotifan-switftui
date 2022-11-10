//
//  AccessToken.swift
//  Cemotify
//
//  Created by Muhammad Arfan on 03/11/2022.
//
import Foundation

struct SpotifyAccessToken: Codable {
	let token: String?
	let type: String?
	let expire: Int?
	
	enum CodingKeys: String, CodingKey {
		case token = "access_token"
		case type = "token_type"
		case expire = "expires_in"
	}
}
