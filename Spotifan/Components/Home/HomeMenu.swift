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
					.foregroundColor(.UI.grey)
					.padding(.vertical,5)
					.padding(.horizontal)
					.background(Color.UI.darkGrey)
					.clipShape(Capsule())
			}
			
			NavigationLink {
				Text("Hello World")
			} label: {
				Text("Podcast")
					.foregroundColor(.UI.grey)
					.padding(.vertical,5)
					.padding(.horizontal)
					.background(Color.UI.darkGrey)
					.clipShape(Capsule())
			}
			
			Spacer()
		}
		.font(.caption)
        .background(Color.UI.black)
		
	}
}

struct HomeMenu_Previews: PreviewProvider {
	static var previews: some View {
		HomeMenu()
	}
}
