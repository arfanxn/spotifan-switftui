//
//  APIManager.swift
//  Spotifan
//
//  Created by Muhammad Arfan on 03/11/22.
//
import Foundation
import Combine

// singleton class with generic type (T is Decodable)
class APIManager<T: Decodable> {
	
	// request model for request
	struct RequestModel {
		let url: URL?
		let method: String
	}
	
	// shared instance
	static var shared: APIManager<T> {
		return APIManager<T>()
	}
	
	private init() {}

}
