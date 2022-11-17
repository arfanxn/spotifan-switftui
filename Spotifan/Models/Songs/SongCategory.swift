//
//  SongCategory.swift
//  Spotifan
//
//  Created by Muhammad Arfan on 16/11/22.
//

import Foundation

struct SongCategory : Codable, Identifiable {
    var id : UUID = UUID() ;
    let name :  String ;
}
