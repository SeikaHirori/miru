//
//  URLSession-Decode.swift
//  swift_miru
//
//  Created by Seika Hirori on 4/17/23.
//

import Foundation

extension URLSession {
    
    /// # RFER #1
    func decode<T: Decodable>(_ type: T.Type = T.self, from url: URL, keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys, dataDecodingStrategy: JSONDecoder.DataDecodingStrategy = .deferredToData, dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate ) async throws -> T {
        
        let (data, _) = try await data(from: url)
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = keyDecodingStrategy
        decoder.dataDecodingStrategy = dataDecodingStrategy
        decoder.dateDecodingStrategy = dateDecodingStrategy
        
        let decoded: T = try decoder.decode(T.self, from: data)
        return decoded
    }
}
