//
//  ScrollOffsetPreferenceKey.swift
//  Spotifan
//
//  Created by Muhammad Arfan on 01/11/22.
//

import Foundation
import SwiftUI

struct RectanglePreferenceKey: PreferenceKey {
	
	static var defaultValue: CGRect = .zero
	
	static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
		value = nextValue()
	}
}


