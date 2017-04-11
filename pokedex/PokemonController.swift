//
//  PokemonController.swift
//  pokedex
//
//  Created by Gavin Olsen on 4/11/17.
//  Copyright © 2017 Gavin Olsen. All rights reserved.
//

import Foundation

class PokemonController {
    
    static let base = "http://pokeapi.co/api/v2/pokemon/"
    
    static func fetchPokemon(for searchTerm: String, completion: @escaping (Pokemon?) -> Void) {
        
        guard let url = URL(string: base) else {
            completion(nil)
            return
        }
        
        let searchURL = url.appendingPathComponent(searchTerm.lowercased())
        
        NetworkController.performRequest(url: searchURL, httpMethod: .get) { (data, error) in
            guard let data = data, let _ = String(data: data, encoding: .utf8) else {
            
                NSLog("no data reurned")
                completion(nil)
                return
            }
            
            guard let jsonDictionary = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String:Any] else {
            completion(nil)
            return
            
            }
            
            let pokemon = Pokemon(dict: jsonDictionary)
            completion(pokemon)
        }
    }
    
}
