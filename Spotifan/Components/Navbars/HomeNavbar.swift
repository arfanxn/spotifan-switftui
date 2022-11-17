//
//  HomeNavbar.swift
//  Spotifan
//
//  Created by Muhammad Arfan on 10/11/22.
//

import SwiftUI

class HomeNavbarViewModel : ObservableObject {
    
    @Published var showNavbar : Bool = true ;
    
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

struct HomeNavbar: View {
    
    @StateObject var vm : HomeNavbarViewModel = .init() ;
    
    var content : AnyView
    
    var body: some View {
        Navbar(vm: .init(), self.navbar, content: self.content) { navbarRect, contentRect in
                self.vm.showNavbar = (contentRect.minY < -50) ? false : true ;
        }
    }
    
    var navbar : AnyView {
        .init(
            VStack{
                if (self.vm.showNavbar) {
                    HStack{
                        Text(self.vm.getGreeting())
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
                .padding(.vertical,10)
                .padding(.horizontal)
                .background(Color.black)
            
        )
    }
    
}

struct HomeNavbar_Previews: PreviewProvider {
    static var previews: some View {
        HomeNavbar(content: .init(
            LazyVStack{
                ForEach(0..<50, id: \.self) { index in
                    Text("Index \(index)")
                }
            }
        ))
    }
}
