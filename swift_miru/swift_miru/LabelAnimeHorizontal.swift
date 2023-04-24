//
//  LabelAnimeHorizontal.swift
//  swift_miru
//
//  Created by Seika Hirori on 4/16/23.
//

import SwiftUI

struct LabelAnimeHorizontal: View {
    let animeEntry: AnimeEntry
    
    
    let geoWidth: CGFloat
    let geoHeight: CGFloat
    
    var body: some View {
        return HStack {
            GeometryReader { geoIn in
                HStack(spacing: 0) {
                    AsyncImage(url: URL(string: animeEntry.picture)) { image in
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
            .frame(width: geoWidth * 0.2)
            
            
            
            Text(animeEntry.title)
                .font(.title)
                .minimumScaleFactor(0.1)
                .frame(maxWidth: .infinity, alignment: .center)
                .frame(maxHeight: .infinity)
                .padding()
                .background(Color.indigo)
                .foregroundColor(.white)
            
            
            
            
            
            // Disable for now
            VStack {
                Text(animeEntry.animeSeason.formattedSeason)
                Text(animeEntry.animeSeason.formattedYear)
                Text(animeEntry.status)
            }
            .font(.caption)
            .minimumScaleFactor(0.1)
            .frame(width: geoWidth * 0.10, alignment: .center)
            .frame(maxHeight: .infinity)
            .padding(.vertical)
            .background(Color.green)
            .foregroundColor(Color.white)

        
//                Spacer()
        
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
        VStack {
            GeometryReader { geo in
                let geoWidth: CGFloat = geo.size.width
                let geoHeight: CGFloat = geo.size.height
                
                VStack {
                    LabelAnimeHorizontal(animeEntry: minamiDb.data[2], geoWidth: geoWidth, geoHeight: geoHeight)
                }
            }
        }
    }
}
