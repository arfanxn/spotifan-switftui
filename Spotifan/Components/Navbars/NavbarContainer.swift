//
//  Navbar.swift
//  Spotifan
//
//  Created by Muhammad Arfan on 01/11/22.
//

import SwiftUI

class NavbarViewModel : ObservableObject {
    @Published var navbarRect : CGRect = .zero;
    @Published var contentRect : CGRect = .zero;
}

typealias NavbarTypealias<V> = Group<V> where V:View


struct Navbar <Content: View>: View {
    
    typealias Handler = (_ navbarRect : CGRect, _ contentRect : CGRect) -> Void ;
    
    @StateObject var vm : NavbarViewModel = .init();
    
    var navbar : Content;
//    var content : Content;
//  var handler : Handler;
    
    init(@ViewBuilder _ navbar: () -> Content) {
        self._vm = StateObject(wrappedValue: .init())
        self.navbar = navbar()
//        self.content = Text("Hello")
    }
    
    var body: some View {
        ScrollView(
            axes: [.horizontal],
            showsIndicators: false
        ) {
            self.navbar
//            self.content
            
        }
    }
    
}

struct Navbar_Previews: PreviewProvider {
    static var previews: some View {
        Navbar {
            HStack{
                Text("Hello world")
                Text("Hello world")
                Text("Hello world")
            }
        }
    }
}

