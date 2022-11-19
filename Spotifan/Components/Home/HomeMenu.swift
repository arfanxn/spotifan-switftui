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
				Text("Musics")
			} label: {
                Text("Musics")
                    .foregroundColor(.UI.white)
                    .padding(.vertical,8)
                    .padding(.horizontal)
                    .background(Color.UI.darkGrey)
                    .clipShape(Capsule())
			}
			
			NavigationLink {
				Text("Podcasts")
			} label: {
                Text("Podcasts")
                    .foregroundColor(.UI.white)
                    .padding(.vertical,8)
                    .padding(.horizontal)
                    .background(Color.UI.darkGrey)
                    .clipShape(Capsule())
			}
			
			Spacer()
		}
        .font(.caption)
        .fontWeight(.semibold)
        .background(Color.UI.black)
		
	}
}

struct HomeMenu_Previews: PreviewProvider {
	static var previews: some View {
		HomeMenu()
	}
}
