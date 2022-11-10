//
//  CombineStore.swift
//  Spotifan
//
//  Created by Muhammad Arfan on 01/11/22.
//

import Foundation
import Combine

class CombineStore : ObservableObject {
	static let shared = CombineStore()
	
	private init () {}
	
	static var cancellables = Set<AnyCancellable>()
}
