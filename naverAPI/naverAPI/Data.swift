//
//  Data.swift
//  naverAPI
//
//  Created by 심현석 on 2023/02/11.
//

import Foundation

// MARK: - JSONData
struct JSONData: Codable {
    let items: Items
}

// MARK: - Items
struct Items: Codable {
    let item: [Item]
}

// MARK: - Item
struct Item: Codable {
    let statName, statId, chgerId, chgerType: String
    let address: String
    let lat, lng: String

    enum CodingKeys: String, CodingKey {
        case statName = "statNm"
        case statId, chgerId, chgerType
        case address = "addr"
        case lat, lng
    }
}
