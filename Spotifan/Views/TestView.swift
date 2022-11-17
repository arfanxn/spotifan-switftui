//
//  TestView.swift
//  Spotifan
//
//  Created by Muhammad Arfan on 06/11/22.
//

import SwiftUI
import Request
import Json

class TestViewModel : ObservableObject {
    @Published var navbarRect : CGRect = .zero;
    @Published var contentRect : CGRect = .zero;
    @Published var showNavbar : Bool = true ;
}

struct TestView: View {
    @StateObject var vm : TestViewModel ;
    
    var body: some View {
        NavigationStack{
            ZStack{
                ScrollView{
                    ZStack{
                        VStack{
                            self.top
                            Spacer()
                        }
                        .zIndex(1)
                        
                        LazyVStack(spacing: 20){
                            ForEach(1..<70) { index in
                                Rectangle()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 50)
                                    .foregroundColor(.mint)
                                    .overlay {
                                        Text("\(index)")
                                    }
                            }
                        }
                    }
                }
                .clipped()
                self.bottom
            }
        }
    }
    
    
    var top : some View {
        VStack{
            HStack{
                ForEach(1..<4) { index in
                    Text("\(index)")
                }
            }
            .padding(.all)
            .frame(maxWidth: .infinity)
            .background(Color.yellow)
            
            Spacer()
        }
    }
    
    var bottom : some View {
        VStack{
            Spacer()
            
            HStack{
                ForEach(1..<4) { index in
                    Text("\(index)")
                }
            }
            .padding(.all)
            .frame(maxWidth: .infinity)
            .background(Color.black)
        }
    }
    
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView(vm: .init())
    }
}
