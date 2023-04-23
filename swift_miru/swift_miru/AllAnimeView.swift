//
//  AllAnimeView.swift
//  swift_miru
//
//  Created by Seika Hirori on 4/16/23.
//

import SwiftUI

struct AllAnimeView: View {
    let loadedOfflineMinamiDatabase: OfflineMinamiDatabase
    
    let columns = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        
        return NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
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
    static let minamiDb = loadMinamiDb(fileName: MyVariables.fileName)
    
    static var previews: some View {
        AllAnimeView(loadedOfflineMinamiDatabase: minamiDb)
    }
}
