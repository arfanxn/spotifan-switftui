//
//  SongHorizontalScroll.swift
//  Spotifan
//
//  Created by Muhammad Arfan on 16/11/22.
//

import SwiftUI

struct SongCarousel: View {
    
    enum Style {
        case reguler, small, regulerRounded, smallRounded ;
    }
    
    let title : String;
    let style : SongCarousel.Style ;
    
    var imageSize : CGSize {
        let style = self.style ;
        switch style {
        case .smallRounded:
            return CGSize(width: 112, height: 112)
        case .small:
            return CGSize(width: 112, height: 112)
        default:
            // case .reguler
            // case .regulerRounded
            return CGSize(width: 152, height: 152)
        }
    }
    
    var body: some View {
        VStack(alignment: .leading){
            Text(self.title).font(.title2.bold())
            
            SwiftUI.ScrollView(.horizontal ,showsIndicators: false) {
                HStack(spacing: 15){
                    ForEach(1..<10) { index in
                        VStack(alignment: .leading, spacing: 15){
                            GeometryReader { geo in
                                Image("image_test")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: self.imageSize.width, height: self.imageSize.height )
                                    .clipShape(
                                        RoundedRectangle(
                                            cornerRadius:
                                                ( (self.style == .regulerRounded) ||
                                                  (self.style == .smallRounded) )
                                            ? (5 / 100 * geo.size.width) : 0
                                        )
                                        
//                                        Rectangle()
                                    )
                            }
                            .frame(width: self.imageSize.width, height: self.imageSize.height)
                            Text("Hello song")
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(.UI.grey)
                        }
                    }
                }
            } // end of ScrollView
        } // end of HStack
    }
    
}

struct SongCarousel_Previews: PreviewProvider {
    static var previews: some View {
        SongCarousel(title: "Favorites", style: .reguler)
    }
}
