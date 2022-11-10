//
//  GeometryGetter.swift
//  Spotifan
//
//  Created by Muhammad Arfan on 09/11/22.
//

import SwiftUI

struct GeometryGetter: View {
	@Binding var rect: CGRect
	
	init(rect: Binding<CGRect>) {
		self._rect = rect
	}
	
	var body: some View {
		GeometryReader { geometry in
			AnyView(Color.clear)
				.onAppear{
					self.rect = geometry.frame(in: .global)
				}
		}
	}
}
