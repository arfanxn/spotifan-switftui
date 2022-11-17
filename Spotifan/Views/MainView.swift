//
//  MainView.swift
//  Spotifan
//
//  Created by Muhammad Arfan on 16/11/22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.clear.edgesIgnoringSafeArea(.all)
                
                TabView {
                    HomeView()
                        .tabItem {
                            Text("Home")
                            Image(systemName: "house")
                        }
                    ExploreView()
                        .tabItem {
                            Text("Search")
                            Image(systemName: "magnifyingglass")
                        }
                    LibraryView()
                        .tabItem {
                            Text("Your Library")
                            Image(systemName: "rectangle.stack")
                        }
                }
                
            }
        }

    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
