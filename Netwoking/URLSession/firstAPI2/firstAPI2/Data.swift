//
//  Data.swift
//  firstAPI2
//
//  Created by 심현석 on 2022/10/11.
//

import Foundation

struct JSONData: Codable {
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
