//
//  LabelAnimeHorizontal.swift
//  swift_miru
//
//  Created by Seika Hirori on 4/16/23.
//

import SwiftUI

struct LabelAnimeHorizontal: View {
    let animeEntry: AnimeEntry
    
    var body: some View {
        return HStack{
            Text(animeEntry.title)
                .font(.title)
                .minimumScaleFactor(0.1)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding()
                .background(Color.indigo)
                .foregroundColor(.white)
                
            
            Spacer()
            
            VStack {
                Text(animeEntry.animeSeason.formattedSeason)
                Text(animeEntry.status)
            }
            .font(.caption)
            .padding(.vertical)
            .frame(maxWidth: 100, alignment: .center)
            Spacer()
            
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: 100)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(.blue)
        }
        

        
    }
}

struct LabelAnimeHorizontal_Previews: PreviewProvider {
    static let minamiDb = loadMinamiDb(fileName: "anime-offline-database.json")
    
    static var previews: some View {
        LabelAnimeHorizontal(animeEntry: minamiDb.data[2])
    }
}
