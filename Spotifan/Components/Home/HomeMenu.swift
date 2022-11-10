//
//  HomeMenu.swift
//  Spotifan
//
//  Created by Muhammad Arfan on 02/11/22.
//

import SwiftUI

struct HomeMenu: View {
	var body: some View {
		HStack(alignment: .center , spacing: 10) {
			
			NavigationLink {
				Text("Hello World")
			} label: {
				Text("Music")
					.foregroundColor(.UI.accent)
					.padding(.vertical,5)
					.padding(.horizontal)
					.background(Color.UI.secondary)
					.clipShape(Capsule())
			}
			
			NavigationLink {
				Text("Hello World")
			} label: {
				Text("Podcast")
					.foregroundColor(.UI.accent)
					.padding(.vertical,5)
					.padding(.horizontal)
					.background(Color.UI.secondary)
					.clipShape(Capsule())
			}
			
			Spacer()
		}
		.font(.caption)
		
	}
}

struct HomeMenu_Previews: PreviewProvider {
	static var previews: some View {
		HomeMenu()
	}
}
