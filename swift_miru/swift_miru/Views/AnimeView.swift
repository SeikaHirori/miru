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
        return VStack {
            GeometryReader { geometry in
                let geoWidth = geometry.size.width
                let geoHeight = geometry.size.height

                ScrollView {
                                    
                    
                    VStack {
                        AsyncImage(url: URL(string: animeEntry.picture)) { image in
                            image
                                .resizable()
                                .scaledToFit()
                        } placeholder: {
                            ProgressView()
                        }
                        .padding()
                        .frame(maxHeight: geoHeight * 0.5, alignment: .center)
                        Spacer()
                        
                        
                        VStack {
                            Text(animeEntry.title)
                            Text(animeEntry.status)
                            Text(animeEntry.animeSeason.formattedSeason)
                        }
                        .font(.headline)
                        .frame(maxHeight: .infinity)
                        
                        Spacer()
                        
                    }
                    Spacer()
                }
                
                Spacer()
                
            }

        }
        .padding()
        .frame(alignment: .center)

            
    }
}

struct AnimeView_Previews: PreviewProvider {
    static let minamiDb = loadMinamiDb(fileName: MyVariables.fileName)
    
    static var previews: some View {
        let previewEntry = minamiDb.data[0]
        
        AnimeView(animeEntry: previewEntry)
    }
}
