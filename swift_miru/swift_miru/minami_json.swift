//
//  minami_json.swift
//  swift_miru
//
//  Created by Seika Hirori on 4/15/23.
//

import Foundation


struct OfflineMinamiDatabase:Codable {
    let license: License
    let repository: String
    let lastUpdate: String
    let data: [AnimeEntry]
    
    struct License: Codable {
        let name: String
        let url: String
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
