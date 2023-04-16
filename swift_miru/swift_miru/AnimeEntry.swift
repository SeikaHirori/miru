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
    
    // Disabling as they are URLs for pictures
//    let picture: String
//    let thumbnail: String
    
    // Disabling these two as they take too long for preview to be able to load
//        let synonyms: [String]
//        let relations: [String]
    let tags: [String]

}

struct AnimeSeason: Codable {
    let season: String?
    let year: Int?
    
    var formattedSeason: String {
        "\(season ?? "N/A") \(year?.description ?? ":'[")"
    }
}
