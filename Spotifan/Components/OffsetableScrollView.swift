//
//  OffsetableScrollView.swift
//  Spotifan
//
//  Created by Muhammad Arfan on 01/11/22.
//

import SwiftUI

struct OffsettableScrollView<T: View>: View {
	
	let axes: Axis.Set
	let showsIndicator: Bool
	let onOffsetChanged: (CGPoint) -> Void
	let content: T
	let coordinateSpace : String = "ScrollViewOrigin\(Int.random(in: 1000..<10000))" ;
	
	init(axes: Axis.Set = .vertical,
		 showsIndicator: Bool = true,
		 onOffsetChanged: @escaping (CGPoint) -> Void = { _ in },
		 @ViewBuilder content: () -> T
	) {
		self.axes = axes
		self.showsIndicator = showsIndicator
		self.onOffsetChanged = onOffsetChanged
		self.content = content()
	}
	
	var body: some View {
		ScrollView(axes, showsIndicators: showsIndicator) {
			GeometryReader { proxy in
				Color.clear.preference(
					key: ScrollOffsetPreferenceKey.self,
					value: proxy.frame(
						in: .named(self.coordinateSpace)
					).origin
				)
			}
			.frame(width: 0, height: 0)
			content
		}
		.coordinateSpace(name: self.coordinateSpace)
		.onPreferenceChange(ScrollOffsetPreferenceKey.self,
							perform: onOffsetChanged)
	}
}

struct OffsetableScrollView_Previews: PreviewProvider {
	@State static private var verticalOffset: CGFloat = 0.0
	
    static var previews: some View {
		VStack {
			Text("Offset: \(String(format: "%.2f", verticalOffset))")
				.frame(maxWidth: .infinity)
				.padding()
				.background(Color.yellow)
			
			OffsettableScrollView { point in
				verticalOffset = point.y
			} content: {
				LazyVStack {
					ForEach(0..<200) { index in
						Text("Row number \(index)")
							.padding()
					}
				}
			}
		}
    }
}
