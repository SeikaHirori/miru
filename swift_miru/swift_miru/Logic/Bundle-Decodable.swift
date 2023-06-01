//
//  Bundle-Decodable.swift
//  swift_miru
//
//  Created by Seika Hirori on 4/15/23.
//

import Foundation

extension Bundle {
    func decode(_ file: String) -> OfflineMinamiDatabase {
        var result: OfflineMinamiDatabase
        
        func failureMessage(type: String) -> String {
            return "Failed to \(type) \(file) from bundle."
        }
        
        guard let url = self.url(forResource: file, withExtension: nil) else {
            let type: String = "locate"
            let errorMessage = failureMessage(type: type)
            
            print(errorMessage)
            fatalError(errorMessage)}
        
        guard let data = try? Data(contentsOf: url) else {
            let type: String = "load"
            let errorMessage = failureMessage(type: type)
            
            print(errorMessage)
            fatalError(errorMessage)
            
        }
        
        
        let decoder: JSONDecoder = JSONDecoder()
        guard let loaded = try? decoder.decode(OfflineMinamiDatabase.self, from: data) else {
            let type: String = "decode"
            let errorMessage = failureMessage(type: type)
            
            print(errorMessage)
            fatalError(errorMessage)
        }
        
        result = loaded
        return result
    }

}
