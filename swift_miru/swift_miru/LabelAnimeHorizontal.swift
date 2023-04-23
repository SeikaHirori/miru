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
            GeometryReader { geo in
                AsyncImage(url: URL(string: animeEntry.thumbnail)) { image in
                    image.resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: geo.size.width * 0.5, height: geo.size.height * 0.5)
                .frame(width: geo.size.width, height: geo.size.height)
                
            }

            Text(animeEntry.title)
                .font(.title)
                .minimumScaleFactor(0.1)
                .frame(maxWidth: .infinity, alignment: .center)
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
        .frame(maxWidth: .infinity, maxHeight: 100)
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
