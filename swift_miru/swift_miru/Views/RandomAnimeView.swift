//
//  RandomAnimeView.swift
//  swift_miru
//
//  Created by Seika Hirori on 4/16/23.
//

import SwiftUI

struct RandomAnimeView: View {
    let loadedOfflineMinamiDatabase: OfflineMinamiDatabase
    
    @State private var randomIndex: Int = 0
    
    var body: some View {
        return NavigationStack {
            VStack {
                let currentAnimeEntry: AnimeEntry = loadedOfflineMinamiDatabase.data[randomIndex]
                VStack {
                    Text("\(currentAnimeEntry.title)")
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity, maxHeight: 300 ,alignment: .center)
                        .multilineTextAlignment(.center)
                        .minimumScaleFactor(0.1)
                        .padding(.vertical)
                
                    NavigationLink("More info") {
                        AnimeView(animeEntry: currentAnimeEntry)
                        
                    }
                    .padding()
                }
                Divider()
                Button("Random Anime", action: rollRandomAnimeIndex)
                    .frame(minWidth: 200, maxHeight: 50)
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .stroke(Color.black)
                    }
            }
            .padding()
        }
    }
    func rollRandomAnimeIndex() -> () {
        randomIndex = Int.random(in: 0..<loadedOfflineMinamiDatabase.data.count)
    }
}

struct RandomAnimeView_Previews: PreviewProvider {
    static let minamiDb = loadMinamiDb(fileName: MyVariables.fileName)
    
    static var previews: some View {
        RandomAnimeView(loadedOfflineMinamiDatabase: minamiDb)
    }
}
