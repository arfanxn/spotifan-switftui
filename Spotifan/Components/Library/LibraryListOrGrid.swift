//
//  SongListOrGrid.swift
//  Spotifan
//
//  Created by Muhammad Arfan on 19/11/22.
//

import SwiftUI

struct LibraryListOrGrid: View {
    enum Style {
        case list, grid;
    }
    
    @Binding var style : LibraryListOrGrid.Style;
    @State var songs : [Song] = [] ;
    
    var gridItemLayout : [GridItem] {
        self.style == .list ? Array(repeating: GridItem(.flexible()), count: 1)
        :  Array(repeating: GridItem(.flexible(), spacing: 10), count: 2)
    }
    
    var body: some View {
        LazyVGrid(columns: self.gridItemLayout , spacing: 20) {
            if self.style == .list {
                self.itemsListStyle
            } else {
                self.itemsGridStyle
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color.UI.darkestGrey)
    }
    
    var itemsListStyle : some View {
        ForEach( self.songs) { song in
            HStack{
                Image("image_test")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 65 , height: 65, alignment: .center)
                    .clipped()
                
                VStack(alignment : .leading){
                    Text("\(song.title)")
                        .font(.body)
                        .fontWeight(.semibold)
                        .foregroundColor(.UI.white)
                    
                    Text("Hello description")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.UI.grey)
                }
                
                Spacer()
            }
        }
    }
    
    var itemsGridStyle : some View {
        ForEach( 0..<songs.count, id: \.self) { index in
            let song = songs[index];
            
            VStack(alignment : .leading){
                Image("image_test")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .clipShape(Rectangle())
                
                VStack(alignment: .leading){
                    Text("\(song.title)")
                        .font(.body)
                        .fontWeight(.semibold)
                        .foregroundColor(.UI.white)
                    
                    Text("Hello description")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.UI.grey)
                }
                .padding(.horizontal)
            }
        } // end of ForEach
    }
    
}

struct LibraryListOrGrid_Previews: PreviewProvider {
    static var previews: some View {
        LibraryListOrGrid(
            style : .constant(.grid),
            songs: Array(repeating:
                            Song(title:"Test Title",album:"Test Album",thumbnail_string_url:"https"), count: 10)
        )
    }
}



