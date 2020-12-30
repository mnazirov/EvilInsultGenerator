//
//  NetworkManager.swift
//  EvilInsultGenerator
//
//  Created by Marat on 27.12.2020.
//

import Foundation

class NetworkManager {
    
    var currentInsult = Insult(insult: "YOU MUST HAVE BEEN BORN ON A HIGHWAY, BECAUSE THAT'S WHERE MOST ACCIDENTS HAPPEN.")
    
    func showInsult() {
    
        guard let url = URL(string: "https://evilinsult.com/generate_insult.php?lang=en&type=json") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else { return }
            
            do {
                self.currentInsult = try JSONDecoder().decode(Insult.self, from: data)
            } catch let error {
                print(error)
            }
        }.resume()
    }
}
