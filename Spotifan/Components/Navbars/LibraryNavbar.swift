//
//  LibraryNavbar.swift
//  Spotifan
//
//  Created by Muhammad Arfan on 18/11/22.
//

import SwiftUI

struct LibraryNavbar<Content: View>: View {
    
    let content: Content
    
    init(@ViewBuilder _ content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading){
            self.fixedNavbar
            
            ScrollView(axes: [.vertical] , showsIndicators: false) {
                self.scrollableNavbar
                
                self.content
            }
        }
    }
    
    var fixedNavbar : some View {
        HStack(alignment: .center,spacing: 10){
            Image("image_test")
                .resizable()
                .scaledToFit()
                .frame(width: 36, height: 36)
                .clipShape(Circle())
            
            Text("Your Library")
                .font(.title.bold())
            
            Spacer()
            
            NavigationLink {
                Text("Hello World")
            } label: {
                Image(systemName: "magnifyingglass")
            }
            
            NavigationLink {
                Text("Hello World")
            } label: {
                Image(systemName: "plus")
            }
            
        }
        .font(.title)
        .padding(.vertical,16)
        .padding(.horizontal)
        .frame(maxWidth: .infinity)
        .foregroundColor(.UI.white)
    }
    
    var scrollableNavbar : some View {
        HStack(alignment: .center,spacing: 10){
                        
            Button {
                
            } label: {
                Text("Playlists")
                    .foregroundColor(.UI.white)
                    .padding(.vertical,8)
                    .padding(.horizontal)
                    .background(Color.UI.black)
                    .overlay(content: {
                        Capsule().stroke(Color.UI.grey, lineWidth: 1)
                    })
            }
            
            Button {
                
            } label: {
                Text("Albums")
                    .foregroundColor(.UI.white)
                    .padding(.vertical,8)
                    .padding(.horizontal)
                    .background(Color.UI.black)
                    .overlay(content: {
                        Capsule().stroke(Color.UI.grey, lineWidth: 1)
                    })
            }
            
            Button {
                
            } label: {
                Text("Downloadeds")
                    .foregroundColor(.UI.white)
                    .padding(.vertical,8)
                    .padding(.horizontal)
                    .background(Color.UI.black)
                    .overlay(content: {
                        Capsule().stroke(Color.UI.grey, lineWidth: 1)
                    })
            }
            
            Spacer()
            
        }
        .font(.caption)
        .fontWeight(.semibold)
        .padding(.vertical)
        .padding(.horizontal)
        .frame(maxWidth: .infinity)
        .background(Color.UI.black)
    }
}

struct LibraryNavbar_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
