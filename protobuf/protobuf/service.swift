//
//  hi.swift
//  protobuf
//
//  Created by Alfonso Villalobos on 15/02/23.
//

import Foundation

public final class Service {
    public init() {}
    
    public func getPlayers() -> Void {
        let strUrl = "http://192.168.1.65:8000/players"
        guard let url = URL(string: strUrl) else { return }
        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request, completionHandler: getPlayerCompletion).resume()
        
        print("exit")
    }
    
    @Sendable
    func getPlayerCompletion(data: Data?, response: URLResponse?, error: (any Error)?) -> Void {
        guard let data_bytes: Data = data else { return }
        do {
            let players = try Src_Incoming_Players_HttpResponses_GetPlayers(serializedData: data_bytes)
            
            let jsonString = try players.jsonString()
            print(jsonString)
        } catch {
            print("error")
        }
    }
}
