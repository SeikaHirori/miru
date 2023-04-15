//
//  minami_json.swift
//  swift_miru
//
//  Created by Seika Hirori on 4/15/23.
//

import Foundation



struct AnimeEntry:Codable {
    let title: String
    let sources: [String]
    let type: String
    let episodes: Int
    let status: String
    let animeSeason: AnimeSeason
    let synonyms: [String]
    let relations: [String]
    let tags: [String]
    
    
    
    struct AnimeSeason: Codable {
        let season: String
        let year: Int
    }
}



/// Anime database comes from repo: https://github.com/manami-project/anime-offline-database
/// - Returns: URL of database
func get_anime_database_url() -> String {


    var result:String

    let url = "https://github.com/manami-project/anime-offline-database/blob/master/anime-offline-database.json?raw=true"
    
    result = url
    return result
}
