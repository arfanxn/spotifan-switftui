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


struct Navbar : View {
    
    typealias Handler = (_ navbarRect : CGRect, _ contentRect : CGRect) -> Void ;
    
    @StateObject var vm : NavbarViewModel ;
    
    var navbar : AnyView ;
    var content : AnyView ;
    var handler : Handler ;
    
    @State var navbarHasAppear : Bool = false ;
    
    init(vm: NavbarViewModel, _ navbar: AnyView ,
         content : AnyView,
         handler : @escaping Handler
    ) {
        self._vm = StateObject(wrappedValue: vm)
        self.navbar = navbar
        self.content = content
        self.handler = handler
    }
    
    var body: some View {
        ZStack(alignment: .top){
            navbar.zIndex(1)
                .background {
                    // geometry reader for getting navbar size
                    GeometryReader { geo in
                        let rect = geo.frame(in: .global)
                        
                        Color.clear.task(id: rect) {
                            withAnimation(.spring()) {
                                self.vm.navbarRect = rect
                                handler(self.vm.navbarRect, self.vm.contentRect)
                            }
                        }
                        
                        /*
                         Color.clear.onChange(of: rect) { rect in
                             DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                 withAnimation(.spring()) {
                                     self.vm.navbarRect = rect
                                     handler(self.vm.navbarRect, self.vm.contentRect)
                                 }
                             }
                         }
                         */
                    }
                }
                .onAppear{
                    self.navbarHasAppear = true ;
                }
            
             if (self.navbarHasAppear) {
                 contentWrapper
                     .offset(y : self.vm.navbarRect.maxY - self.vm.navbarRect.minY )
             }
            
        }
    }
    
    var contentWrapper : some View {
        ScrollView(.vertical, showsIndicators: false) {
            ZStack{
                content
                
                // get scroll offset of content (as CGRect)
                GeometryReader { geo in
                    let rect = geo.frame(in: .named("content"))
                    
                    Color.clear.task(id: rect) {
                        withAnimation(.spring()) {
                            self.vm.contentRect = rect
                            handler(self.vm.navbarRect, self.vm.contentRect)
                        }
                    }
                    
                    /*
                     Color.clear.onChange(of: rect) { rect in
                         DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                             withAnimation(.spring()) {
                                 self.vm.contentRect = rect
                                 handler(self.vm.navbarRect, self.vm.contentRect)
                             }
                         }
                     }
                     */
                }
            }
        }
        .coordinateSpace(name: "content")
    }
    
}


struct Navbar_Previews: PreviewProvider {
    
    @State var showNavbar : Bool = true ;
    
    static var previews: some View {
        Navbar_Previews().main
    }
    
    var main : some View {
        Navbar(vm: .init(), self.navbar, content: self.content) { navbarRect, contentRect in
            self.showNavbar = (contentRect.minY < -50) ? false : true ;
        }
    }
    
    var navbar : AnyView {
        AnyView(
            VStack{
                if (self.showNavbar) {
                    HStack{
                        Text("Good Night")
                            .font(.title.weight(.bold))
                            .foregroundColor(.UI.white)
                        
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
                        .foregroundColor(.UI.white)
                    }
                }
                HomeMenu()
            }
                .padding(.horizontal)
                .background(Color.black)
            
        )
    }
    
    var content : AnyView{
        return .init(
            LazyVStack{
                ForEach(0..<50, id: \.self) { index in
                    Text("Index \(index)")
                }
            }
        )
    }
    
    
}

