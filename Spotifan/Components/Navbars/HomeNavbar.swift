//
//  HomeNavbar.swift
//  Spotifan
//
//  Created by Muhammad Arfan on 10/11/22.
//

import SwiftUI

class HomeNavbarViewModel : ObservableObject {
    
    public func getGreeting() -> String {
        let hour = Calendar.current.component(.hour, from: Date())
        
        switch hour {
        case 7..<12:
            return "Good Morning"
        case 12..<16:
            return "Good Afternoon"
        case 16..<20:
            return "Good Evening"
        case 20..<24:
            return "Good Night"
        default:
            // case 0..<7:
            return "Spotifan"
        }
    }
    
}

struct HomeNavbar<Content: View>: View {
    
    @StateObject var vm : HomeNavbarViewModel = .init() ;
    
    @State var headerSize : CGSize? = .zero;
    @State var homeMenuSize : CGSize? = .zero;
    @State var navbarSize : CGSize? = .zero;
    @State var headerYOffset : CGFloat = .zero;
    
    let content: Content
    
    init(@ViewBuilder _ content: () -> Content) {
        self.content = content()
    }
    
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
        /* Disabled due to an error EXC_Break
         .onPreferenceChange(ScrollOffsetPreferenceKey.self) { offset in
             if let navbarHeight = self.navbarSize?.height , offset.y < -navbarHeight {
                 self.headerYOffset = abs(abs(offset.y)) - 20 - (self.headerSize?.height ?? 0);
             } else {
                 self.headerYOffset = .zero;
             }
         }
         */
    }
    
    var navbar : some View {
        VStack{
            
            HStack{
                Text(self.vm.getGreeting())
                    .font(.title.weight(.bold))
                    .foregroundColor(.UI.white)
                
                Spacer()
                    .background(Color.UI.black)
                
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
                .foregroundColor(.UI.white)
            }
            .background(GeometryGetter(size: self.$headerSize))
            
            HomeMenu()
                .background(GeometryGetter(size: self.$homeMenuSize))
            
        }
        .padding(.vertical, 10)
        .padding(.horizontal)
        .background(Color.UI.black)
        .background(GeometryGetter(size: self.$navbarSize))
        .offset(y : self.headerYOffset)
    }
    
}

struct HomeNavbar_Previews: PreviewProvider {
    static var previews: some View {
        HomeNavbar {
            LazyVStack{
                ForEach(0..<50, id: \.self) { index in
                    Text("Index \(index)")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                }
            }
        }
    }
}
