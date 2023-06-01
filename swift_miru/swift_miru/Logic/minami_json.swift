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


/// Offline Anime database comes from repo: https://github.com/manami-project/anime-offline-database
/// - Returns: URL of database
let url_regular_manami_project_anime_offline_database: String = "https://raw.githubusercontent.com/manami-project/anime-offline-database/master/anime-offline-database.json"

let url_minified_manami_project_anime_offline_database: String = "https://raw.githubusercontent.com/manami-project/anime-offline-database/master/anime-offline-database-minified.json"

func get_anime_database_repo_url() -> String {

    var result:String

    let url = "https://github.com/manami-project/anime-offline-database/blob/master/anime-offline-database.json?raw=true"
    
    result = url
    return result
}


/// # RFER #1
/// - Returns: <#description#>
func download_manamai_project_anime_offline_database() async -> OfflineMinamiDatabase? {
    
    do {
        let url1 = URL(string: url_regular_manami_project_anime_offline_database)!
        
    // Try to put download bar here?

        let offlineManamiProject: OfflineMinamiDatabase = try await URLSession.shared.decode(OfflineMinamiDatabase.self, from: url1)
        
        return offlineManamiProject
    } catch {
        print("Unexpected error: \(error)")
        return nil
    }
}

func asyncLoadLocalDb(fileName: String) async -> OfflineMinamiDatabase {
    return loadMinamiDb(fileName: fileName)
}


func loadMinamiDb(fileName: String) -> OfflineMinamiDatabase {
    let loadedOfflineMinamiDatabase = Bundle.main.decode(fileName)
    print("db is loaded")

    return loadedOfflineMinamiDatabase
}
