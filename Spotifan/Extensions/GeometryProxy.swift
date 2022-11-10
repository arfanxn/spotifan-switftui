//
//  GeometryReader.swift
//  Spotifan
//
//  Created by Muhammad Arfan on 09/11/22.
//

import SwiftUI

extension GeometryProxy {
	public func scrollOffset(in : CoordinateSpace = .global) -> (vertical: CGFloat, horizontal: CGFloat) {
		return (
			self.frame(in: CoordinateSpace.global).minY,
			self.frame(in: CoordinateSpace.global).minX
		)
	}
}

