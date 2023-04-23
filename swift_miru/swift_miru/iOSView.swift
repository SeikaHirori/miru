//
//  iOSView.swift
//  swift_miru
//
//  Created by Seika Hirori on 4/23/23.
//

import SwiftUI

struct iOSView: View {

    let fileName:String
    
    @State private var loadedOfflineMinamiDatabase: OfflineMinamiDatabase?
//    var loadedOfflineMinamiDatabase: OfflineMinamiDatabase = Bundle.main.decode("anime-offline-database.json")
    
    var body: some View {
        return NavigationStack {
            VStack {
                Text("Hello World")
                Text("Total Entries: \(loadedOfflineMinamiDatabase?.data.count ?? 0)")
                
                if loadedOfflineMinamiDatabase != nil {
                    Text("Database's last update: \(loadedOfflineMinamiDatabase!.lastUpdate)")
                } else {
                    Text("No database detected :'[")
                }
                
                List {
                    if loadedOfflineMinamiDatabase != nil {
                        NavigationLink("All Anime Entries") {
                            AllAnimeView(loadedOfflineMinamiDatabase: loadedOfflineMinamiDatabase!)
                        }
                        
                        NavigationLink("Random entry") {
                            RandomAnimeView(loadedOfflineMinamiDatabase: loadedOfflineMinamiDatabase!)
                        }
                        
                    } else {
                        Text("No database detected :'[")
                    }
                }

            }
            .toolbar {
                VStack {
                    HStack {
                        Text("Credits")
                    }
                    HStack {
                        
                        Button("Download db") {
                            
                            /// # RFER #2
                            Task {
                                loadedOfflineMinamiDatabase = await download_manamai_project_anime_offline_database()
                            }
                            
                        }
                        Divider()
                        
                        Button("Load local db") {
                            Task {
                                loadedOfflineMinamiDatabase = await  asyncLoadLocalDb(fileName: fileName)
                            }
                        }
                        Divider()
                        
                        Button("Save db") {
                            saveDbLocally()
                        }
                        Divider()
                        
                        Button("Clear db") {
                            loadedOfflineMinamiDatabase = nil
                            
                            print("db is cleared!")
                        }
                        
                    }
                    
                }
            }
            
        }
    }
    
    func saveDbLocally() -> Void {
        let encoder = JSONEncoder()
        
        if loadedOfflineMinamiDatabase == nil {
            print("db is non-existent")
            return
        }
        
        if let data = try? encoder.encode(loadedOfflineMinamiDatabase) {
            UserDefaults.standard.set(data, forKey: "loadedOfflineMinamiDatabase")
            
            print("Sucessfully saved!")
        }
    }
    
    /// # RFER #3
    /// - Parameter fileName: file name of database
    /// - Returns: struct data "OfflineMinamiDatabase"
    func asyncLoadLocalDb(fileName: String) async -> OfflineMinamiDatabase {
        return loadMinamiDb(fileName: fileName)
    }

}

struct iOSView_Previews: PreviewProvider {

    static var previews: some View {
        iOSView(fileName: MyVariables.fileName)
    }
}
