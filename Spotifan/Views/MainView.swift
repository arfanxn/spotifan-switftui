//
//  MainView.swift
//  Spotifan
//
//  Created by Muhammad Arfan on 16/11/22.
//

import SwiftUI

struct MainView: View {
    
    @State var selectedTab: TabMenuEnum = .home
    
    var body: some View {
        NavigationStack {
            ZStack {                
                SwiftUI.TabView(selection: self.$selectedTab) {
                    HomeView()
                        .tag(TabMenuEnum.home)
                    ExploreView()
                        .tag(TabMenuEnum.explore)
                    LibraryView()
                        .tag(TabMenuEnum.library)
                }
                
                VStack{
                    Spacer()
                    
                    self.tabs
                }
            }
        }
        .background(Color.UI.black)
        .preferredColorScheme(.dark)
    }
    
    var tabs : some View {
        LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 3)) {
            Button {
                self.selectedTab = .home
            } label: {
                VStack(spacing: 8){
                    Image(systemName: self.selectedTab == .home ? "house.fill" : "house")
                        .font(.system(size: 24, weight: .semibold))
                    Text("Home")
                        .font(.system(size: 12))
                        .fontWeight(.semibold)
                }
                .foregroundColor(
                    self.selectedTab == .home ? .UI.white : .UI.grey
                )
            }
            .frame(maxWidth: .infinity)
            
            Button {
                self.selectedTab = .explore
            } label: {
                VStack(spacing: 8){
                    Image(systemName: self.selectedTab == .explore ? "sparkle.magnifyingglass" : "magnifyingglass")
                        .font(.system(size: 24, weight: .semibold))
                    Text("Search")
                        .font(.system(size: 12))
                        .fontWeight(.semibold)
                }
                .foregroundColor(
                    self.selectedTab == .explore ? .UI.white : .UI.grey
                )
            }
            .frame(maxWidth: .infinity)
            
            Button {
                self.selectedTab = .library
            } label: {
                VStack(spacing: 8){
                    Image(systemName: self.selectedTab == .library ? "rectangle.stack.fill" : "rectangle.stack")
                        .font(.system(size: 24, weight: .semibold))
                        .rotationEffect(Angle(degrees: 90))
                    Text("Your Library")
                        .font(.system(size: 12))
                        .fontWeight(.semibold)
                }
                .foregroundColor(
                    self.selectedTab == .library ? .UI.white : .UI.grey
                )
            }
            .frame(maxWidth: .infinity)
            
        }
        .padding(.all)
        .frame(maxWidth: .infinity)
        .background(Color.UI.darkGrey)
    }
    

}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(selectedTab: .explore)
        //        EmptyView()
    }
}
