//
//  ScrollOffsetPreferenceKey.swift
//  Spotifan
//
//  Created by Muhammad Arfan on 01/11/22.
//

import Foundation
import SwiftUI

struct ScreenSizePrefKey: PreferenceKey {
	
	static var defaultValue: CGPoint = .zero
	
	static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {
		value = nextValue()
	}
	
	static func printVal () {
		print(Value.self)
	}
}


