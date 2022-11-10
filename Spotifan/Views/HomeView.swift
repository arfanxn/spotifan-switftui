//
//  HomeView.swift
//  Spotifan
//
//  Created by Muhammad Arfan on 01/11/22.
//

import SwiftUI

struct HomeView: View {
	
	@Namespace private var animation
	
	@State private var verticalScrollOffset = CGFloat(0)
	@State private var navbarOffset = CGPoint(x: 0, y: 0) ;
	@State private var isNavbarDisappear = false
		
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
