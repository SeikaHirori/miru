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
            fatalError(failureMessage(type: type))
        }
        
        guard let data = try? Data(contentsOf: url) else {
            let type: String = "load"
            fatalError(failureMessage(type: type))
        }
        
        
        let decoder: JSONDecoder = JSONDecoder()
        guard let loaded = try? decoder.decode(OfflineMinamiDatabase.self, from: data) else {
            let type: String = "decode"
            fatalError(failureMessage(type: type))
        }
        
        result = loaded
        return result
    }

}
