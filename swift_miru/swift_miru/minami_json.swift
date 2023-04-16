//
//  minami_json.swift
//  swift_miru
//
//  Created by Seika Hirori on 4/15/23.
//

import Foundation


struct OfflineMinamiDatabase:Codable {
    var license: License
    var repository: String
    var lastUpdate: String
    var data: [AnimeEntry] = [AnimeEntry]()
    
    struct License: Codable {
        let name: String
        let url: String
    }
    


}

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
    
    struct AnimeSeason: Codable {
        let season: String?
        let year: Int?
    }
}

/// Offline Anime database comes from repo: https://github.com/manami-project/anime-offline-database
/// - Returns: URL of database
func get_anime_database_repo_url() -> String {

    var result:String

    let url = "https://github.com/manami-project/anime-offline-database/blob/master/anime-offline-database.json?raw=true"
    
    result = url
    return result
}
