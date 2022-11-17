//
//  SongCategoryGrid.swift
//  Spotifan
//
//  Created by Muhammad Arfan on 16/11/22.
//

import SwiftUI

struct SongCategoryGrid: View {
    private let gridItemLayout = Array(repeating: GridItem(.flexible(), spacing: 10), count: 2)
    
    @State var categories : [SongCategory] = [] ;
    
    var body: some View {
        LazyVGrid(columns: self.gridItemLayout , spacing: 10) {
            ForEach(self.categories) { category in
                GeometryReader { geo in
                    HStack(alignment: .top) {
                        Text("\(category.name)")
                            .font(.subheadline.bold())
                            .foregroundColor(.UI.white)
                        
                        Spacer()
                        
                        VStack{
                            Spacer()
                            
                            Image("image_test")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: self.getImageSize(geometry: geo).width ,
                                       height: self.getImageSize(geometry: geo).height ,
                                       alignment: .center)
                                .clipShape(RoundedRectangle(cornerRadius: 7.5))
                                .rotationEffect(.degrees(110))
                        }
                    }
                    .padding(.top)
                    .padding(.leading, 4)
                    .padding(.trailing, -20)
                    .clipped()
                }
                .frame(height: 100)
                .background(Color.random())
            }
        }
    }
    
    func getImageSize (geometry : GeometryProxy) -> CGSize {
        let size = (geometry.size.height * 2) / 3;
        return  .init(width: size, height: size);
    }
}

struct SongCategoryGrid_Previews: PreviewProvider {
    static var previews: some View {
        SongCategoryGrid(categories : [
            SongCategory(name: "Song Category"),
            SongCategory(name: "Song Category"),
            SongCategory(name: "Song Category"),
            SongCategory(name: "Song Category"),
            
            SongCategory(name: "Song Category"),
            SongCategory(name: "Song Category"),
            SongCategory(name: "Song Category"),
            SongCategory(name: "Song Category"),
            
            SongCategory(name: "Song Category"),
            SongCategory(name: "Song Category"),
            SongCategory(name: "Song Category"),
            SongCategory(name: "Song Category"),
        ])
        .padding(.horizontal)
    }
}


