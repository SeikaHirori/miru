//
//  AllAnimeView.swift
//  swift_miru
//
//  Created by Seika Hirori on 4/16/23.
//

import SwiftUI

struct AllAnimeView: View {
    let loadedOfflineMinamiDatabase: OfflineMinamiDatabase
    
    var body: some View {
        
        return NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(0..<loadedOfflineMinamiDatabase.data.count) { num in
                        let animeEntry: AnimeEntry = loadedOfflineMinamiDatabase.data[num]
                        NavigationLink {
                            VStack {
                                AnimeView(animeEntry: animeEntry)
                            }
                        } label: {
                            LabelAnimeHorizontal(animeEntry: animeEntry)
                        }
                    }
                }
            }
            .navigationTitle("All Anime Titles")
        }
    
    }
}

struct AllAnimeView_Previews: PreviewProvider {
    static let minamiDb = loadMinamiDb(fileName: "anime-offline-database.json")
    
    static var previews: some View {
        AllAnimeView(loadedOfflineMinamiDatabase: minamiDb)
    }
}
