//
//  NetworkManager.swift
//  EvilInsultGenerator
//
//  Created by Marat on 27.12.2020.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchData(from urlJSON: String, in complition: @escaping (Insult) -> Void) {
        guard let url = URL(string: urlJSON) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let currentInsult = try JSONDecoder().decode(Insult.self, from: data)
                DispatchQueue.main.async {
                    complition(currentInsult)
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
}
