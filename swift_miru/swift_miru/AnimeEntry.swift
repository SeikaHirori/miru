//
//  AnimeEntry.swift
//  swift_miru
//
//  Created by Seika Hirori on 4/15/23.
//

import Foundation

struct AnimeEntry:Codable {
    
    let sources: [String]
    let title: String
    let type: String
    let episodes: Int
    let status: String
    let animeSeason: AnimeSeason
    let picture: String
    let thumbnail: String
//        let synonyms: [String]
//        let relations: [String]
    let tags: [String]

}

struct AnimeSeason: Codable {
    let season: String?
    let year: Int?
}
