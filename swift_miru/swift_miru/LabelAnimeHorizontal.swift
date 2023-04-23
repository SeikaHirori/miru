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
        return HStack {
            GeometryReader { geoIn in
                HStack(spacing: 0) {
                    AsyncImage(url: URL(string: animeEntry.thumbnail)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: geoIn.size.width * 0.9, height: geoIn.size.height * 0.9)
                    .frame(width: geoIn.size.width, height: geoIn.size.height)
                    
                }
            }
            .frame(maxWidth: 100)
            
            
            
            Text(animeEntry.title)
                .font(.title)
                .minimumScaleFactor(0.1)
                .frame(maxWidth: .infinity, alignment: .center)
                .frame(maxHeight: .infinity)
                .padding()
                .background(Color.indigo)
                .foregroundColor(.white)
            
            
            
            
            
            //            // Disable for now
            //            Spacer()
            
            //            VStack {
            //                Text(animeEntry.animeSeason.formattedSeason)
            //                Text(animeEntry.status)
            //            }
            //            .font(.caption)
            //            .padding(.vertical)
            //            .frame(maxWidth: 100, alignment: .center)
            //            Spacer()
            
        }
        
        .padding()
        .frame(maxWidth: .infinity, minHeight: 150, maxHeight: 150)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(.blue)
        }
    }
}

struct LabelAnimeHorizontal_Previews: PreviewProvider {
    static let minamiDb = loadMinamiDb(fileName: MyVariables.fileName)
    
    static var previews: some View {
        LabelAnimeHorizontal(animeEntry: minamiDb.data[2])
    }
}
