//
//  AnimeView.swift
//  swift_miru
//
//  Created by Seika Hirori on 4/15/23.
//

import SwiftUI

struct AnimeView: View {
    let animeEntry: AnimeEntry
    
    var body: some View {
        return ScrollView {
            VStack {
                Text(animeEntry.title)
                Text(animeEntry.status)
                Text(animeEntry.animeSeason.formattedSeason)

            }
        }
    }
}

struct AnimeView_Previews: PreviewProvider {
    static let minamiDb = loadMinamiDb(fileName: MyVariables.fileName)
    
    static var previews: some View {
        AnimeView(animeEntry: minamiDb.data[0])
    }
}
