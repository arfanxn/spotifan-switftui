//
//  HomeNavbar.swift
//  Spotifan
//
//  Created by Muhammad Arfan on 10/11/22.
//

import SwiftUI

struct HomeNavbar: View {
	@State var title : String
	var content: AnyView
	
    var body: some View {
		Navbar(navbarHeight: 150,
			   collapsedNavbarHeight: 90,
			   navbar: AnyView(HStack{
			Text(self.title)
				.font(.title.weight(.bold))
				.foregroundColor(.UI.accent)
			Spacer()
			HStack(spacing: 10){
				
				NavigationLink {
					Text("Hello World")
				} label: {
					Image(systemName: "bell")
				}
				
				NavigationLink {
					Text("Hello World")
				} label: {
					Image(systemName: "clock")
				}
				
				NavigationLink {
					Text("Hello World")
				} label: {
					Image(systemName: "gearshape")
				}
				
			}
			.font(.title)
			.foregroundColor(.UI.accent)
		}),
			collapsedNavbar: AnyView(HomeMenu()),
			content: self.content
		)
    }
}

struct HomeNavbar_Previews: PreviewProvider {
    static var previews: some View {
        HomeNavbar(title: "Good Night", content: AnyView(
			Text("Hello world")
		))
    }
}
