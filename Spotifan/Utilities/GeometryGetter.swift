//
//  GeometryGetter.swift
//  Spotifan
//
//  Created by Muhammad Arfan on 09/11/22.
//

import SwiftUI

struct GeometryRectGetter: View {
	@Binding var rect: CGRect
    var frameIn : CoordinateSpace
	
    init(rect: Binding<CGRect>,frameIn : CoordinateSpace = .global) {
		self._rect = rect
        self.frameIn = frameIn
	}
	
	var body: some View {
		GeometryReader { geometry in
			Color.clear.onAppear{
                self.rect = geometry.frame(in: self.frameIn)
				}
		}
	}
}

struct GeometrySizeGetter: View {
    @Binding var size: CGSize
    var frameIn : CoordinateSpace
    
    init(size: Binding<CGSize>,frameIn : CoordinateSpace = .global) {
        self._size = size
        self.frameIn = frameIn
    }
    
    var body: some View {
        GeometryReader { geometry in
            Color.clear.onAppear{
                self.size = geometry.frame(in: self.frameIn).size
            }
        }
    }
}


