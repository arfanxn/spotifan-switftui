//
//  GeometryGetter.swift
//  Spotifan
//
//  Created by Muhammad Arfan on 09/11/22.
//

import SwiftUI

struct GeometryGetter: View {
	@Binding var rect: CGRect
    var frameIn : CoordinateSpace
	
    init(rect: Binding<CGRect>,frameIn : CoordinateSpace = .global) {
		self._rect = rect
        self.frameIn = frameIn
	}
	
	var body: some View {
		GeometryReader { geometry in
			AnyView(Color.clear)
				.onAppear{
                    self.rect = geometry.frame(in: self.frameIn)
				}
		}
	}
}
