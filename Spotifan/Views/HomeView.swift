//
//  HomeView.swift
//  Spotifan
//
//  Created by Muhammad Arfan on 01/11/22.
//

import SwiftUI

struct HomeView: View {
	
	var body: some View {
		HomeNavbar(title: "Good Night", content: AnyView(
			Text("Hello")
		))
	}
}

struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView()
	}
}
