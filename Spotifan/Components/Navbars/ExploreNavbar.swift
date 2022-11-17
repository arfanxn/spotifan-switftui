//
//  ExploreNavbar.swift
//  Spotifan
//
//  Created by Muhammad Arfan on 16/11/22.
//

import SwiftUI

class ExploreNavbarViewModel : ObservableObject {
    @Published var showNavbar : Bool = true ;
    @Published var keyword : String = "";
}

struct ExploreNavbar: View {
    
    @StateObject var vm : ExploreNavbarViewModel = .init() ;
    
    var content : AnyView
    
    var body: some View {
        Navbar(vm: .init(), self.navbar, content: self.content) { navbarRect, contentRect in
                self.vm.showNavbar = (contentRect.minY < -50) ? false : true ;
        }
    }
    
    var navbar : AnyView {
        .init(
            VStack(alignment: .leading){
                if (self.vm.showNavbar) {
                    Text("Search")
                        .font(.title2.bold())
                        .padding(.vertical,20)
                }
                
                NavigationLink {
                    Text("Search View")
                } label: {
                    Label("What do you want to listen to?", systemImage: "magnifyingglass")
                        .font(.headline)
                        .foregroundColor(.UI.darkGrey)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.UI.white)
            }
                .padding(.vertical,10)
                .padding(.horizontal)
                .frame(maxWidth: .infinity)
                .background(Color.black)
            
        )
    }
}

struct ExploreNavbar_Previews: PreviewProvider {
    static var previews: some View {
        ExploreNavbar(vm: .init(), content: .init(
            EmptyView()
        ))
    }
}
