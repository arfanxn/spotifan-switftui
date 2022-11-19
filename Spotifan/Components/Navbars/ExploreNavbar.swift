//
//  ExploreNavbar.swift
//  Spotifan
//
//  Created by Muhammad Arfan on 16/11/22.
//

import SwiftUI

class ExploreNavbarViewModel : ObservableObject {
    @Published var keyword : String = "";
}

struct ExploreNavbar: View {
    
    @StateObject var vm : ExploreNavbarViewModel = .init() ;
    
    @State var headerSize : CGSize? = .zero;
    @State var navbarSize : CGSize? = .zero;
    @State var navbarYOffset : CGFloat = .zero;
    
    var content : AnyView
    
    var body: some View {
        NavbarContainer{
            NavbarTypealias{
                self.navbar
            }
            
            NavbarContentTypealias{
                self.content
            }
        }
        .background(Color.UI.black)
        .onPreferenceChange(ScrollOffsetPreferenceKey.self) { offset in
            if let headerHeight = self.headerSize?.height , offset.y < -headerHeight {
                self.navbarYOffset = abs(offset.y) -
                    ((self.navbarSize?.height ?? 0) - (self.headerSize?.height ?? 0));
            } else {
                self.navbarYOffset = .zero;
            }
        }
    }
    
    var navbar : some View {
        VStack(alignment: .leading){
            Text("Search")
                .font(.title.bold())
                .foregroundColor(.UI.white)
                .padding(.vertical,20)
                .background(GeometryGetter(size: self.$headerSize))
            
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
        .background(Color.UI.black)
        .background(GeometryGetter(size: self.$navbarSize))
        .offset(y : self.navbarYOffset)
    }
}

struct ExploreNavbar_Previews: PreviewProvider {
    static var previews: some View {
        ExploreNavbar(vm: .init(), content: .init(
            EmptyView()
        ))
    }
}
