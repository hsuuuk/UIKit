//
//  Data.swift
//  firstAlamofire
//
//  Created by 심현석 on 2022/10/12.
//

import Foundation

struct DecodedData: Codable {
    let results: [Music]
}

struct Music: Codable {
    let albumName: String?
    let albumImage: String?
    
    enum CodingKeys: String,CodingKey {
        case albumName = "collectionName"
        case albumImage = "artworkUrl100"
    }
}
