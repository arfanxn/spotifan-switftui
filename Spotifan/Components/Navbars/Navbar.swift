//
//  Navbar.swift
//  Spotifan
//
//  Created by Muhammad Arfan on 01/11/22.
//

import SwiftUI

struct Navbar : View {
	
	@ObservedObject private var viewFrame: ViewFrame = ViewFrame()
	@State private var spacerSize : CGRect = .zero
	
	var navbarHeight: CGFloat = 150
	var collapsedNavbarHeight: CGFloat = 90
	var navbar: AnyView
	var collapsedNavbar: AnyView? = nil
	var content: AnyView
	
	
	public var body : some View {
		
		ScrollView{
			
			VStack{
				self.content
			}
			.offset(y: navbarHeight - 25)
			.background(GeometryGetter(rect: $viewFrame.frame))
			
			GeometryReader { geometry in
				VStack{
					Spacer()
						.background(GeometryGetter(rect: self.$spacerSize))
					
					self.navbar
					
					self.collapsedNavbar
				}
				.frame(width: .infinity, height: self.navbarHeight)
				.padding(.horizontal, 10)
				.padding(.bottom, 7.5)
				.background(Color.UI.background)
				.offset(x: 0, y: self.getNavbarOffset(geometry))
			}
			.frame(height: self.navbarHeight)
			.offset(x: 0, y: -(viewFrame.startingRect?.maxY ?? UIScreen.main.bounds.height))
		}
		.clipped()
	}
	
	private func getNavbarOffset(_ geometry: GeometryProxy) -> CGFloat {
		let verticalScrollOffset = geometry.frame(in: .global).minY // vertical scroll offset
		let sizeOffScreen = navbarHeight - collapsedNavbarHeight // size that dosn't appear on the screen
		
		/// if our verticalScrollOffset is roughly less than "-sizeOffScreen"
		/// (the amount scrolled / amount off screen)
		if verticalScrollOffset < -sizeOffScreen {
			// Since we want "collapsedNavbarHeight" px fixed on the screen we get our offset of "-sizeOffScreen" or anything less than. Take the abs value of
			let collapsedNavbarOffset = abs(min(-sizeOffScreen, verticalScrollOffset))
			
			return collapsedNavbarOffset - sizeOffScreen
		}
		
		// Navbar was pulled down
		let navbarOffset = verticalScrollOffset > 0 ? -verticalScrollOffset : 0 ;
		return navbarOffset ;
	}
}


struct Navbar_Previews: PreviewProvider {
	
	@ViewBuilder
	static var previews: some View {
		VStack{
			Navbar(navbarHeight: 150,
				   collapsedNavbarHeight: 90,
				   navbar: AnyView(HStack{
				Text("Good Night")
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
			}), collapsedNavbar: AnyView(HomeMenu()) ,
				   content: .init(
					ForEach(0..<100) { int in
						Text("Hello  number \(int)")
					}
				)
			)
		}
	}
}

