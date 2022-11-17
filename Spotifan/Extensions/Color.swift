//
//  Color.swift
//  Spotifan
//
//  Created by Muhammad Arfan on 01/11/22.
//

import Foundation
import SwiftUI

extension Color {
	
	struct UI {
		static let brandGreen = Color("BrandGreen");
		static let grey = Color("Grey");
		static let darkGrey = Color("DarkGrey");
		static let darkestGrey = Color("DarkestGrey");
		static let black = Color("Black");
		static let white = Color("White");
	}
    
    static func random(randomOpacity: Bool = false) -> Color {
            Color(
                red: .random(in: 0...1),
                green: .random(in: 0...1),
                blue: .random(in: 0...1),
                opacity: randomOpacity ? .random(in: 0...1) : 1
            )
        }
}
