//
//  Song.swift
//  Spotifan
//
//  Created by Muhammad Arfan on 03/11/22.
//

import Foundation

struct Song : Codable, Identifiable {
	var id : UUID = UUID() ;
	let title :  String ;
	let album : String ;
	let thumbnail_string_url : String? ;
}
