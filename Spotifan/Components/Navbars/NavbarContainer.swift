//
//  Navbar.swift
//  Spotifan
//
//  Created by Muhammad Arfan on 01/11/22.
//

import SwiftUI

class NavbarViewModel : ObservableObject {
}

typealias NavbarTypealias<V> = Group<V> where V:View
typealias NavbarContentTypealias<V> = Group<V> where V:View

struct NavbarContainer <V1, V2>: View where V1: View, V2: View {
    
    typealias ContentTuple = () -> TupleView<(NavbarTypealias<V1>, NavbarContentTypealias<V2>)>
    typealias Handler = (_ navbarRect : CGRect, _ contentRect : CGRect) -> Void ;
    
    private let contentTuple: ContentTuple;
    @State private var navbarSize: CGSize = .zero ;
    @State private var contentSize: CGSize?;
    
    
    @StateObject var vm : NavbarViewModel = .init();
    
    //  var handler : Handler;
    
    init(@ViewBuilder _ contentTuple : @escaping ContentTuple) {
        self._vm = StateObject(wrappedValue: .init())
        self.contentTuple = contentTuple
    }
    
    var body: some View {
        let (navbar, content) = self.contentTuple().value
        return SwiftUI.ScrollView(
            .vertical,
            showsIndicators: false
        ) {
            navbar.zIndex(1)
            content
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .padding(.top, 000.1)
        /* Disabled due to an error EXC_Break
        return ScrollView(
            axes: [.vertical],
            showsIndicators: false
        ) {            
            navbar.zIndex(1)        
            content
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .padding(.top, 000.1)
         */
    }
    
}

struct Navbar_Previews: PreviewProvider {
    static var previews: some View {
        NavbarContainer{
            NavbarTypealias{
                Image(systemName: "envelope.fill")
            }
            
            NavbarContentTypealias{
                Image(systemName: "envelope.fill")
            }
        }
    }
}

