//
//  Pokemon.swift
//  pokedex
//
//  Created by Gavin Olsen on 4/11/17.
//  Copyright © 2017 Gavin Olsen. All rights reserved.
//

import Foundation

//MARK: KEYS

fileprivate let namekey = "name"
fileprivate let idkey = "id"
fileprivate let abilitieskey = "abilities"
fileprivate let abilitykey = "ability"

struct Pokemon {
    
    //MARK: PROPERTIES
    let name: String
    let id: Int
    let abilities: [String]
    
}

//MARK: DICT REP

extension Pokemon {
    
    init?(dict: [String:Any]) {
        
        guard let name = dict[namekey] as? String, let id = dict[idkey] as? Int, let abilityDict = dict[abilitieskey] as? [[String:AnyObject]] else { return nil}
        
        let abilities = abilityDict.flatMap { $0[abilitykey]?[namekey] as? String }
        
        self.init(name: name, id: id, abilities: abilities)
        
    }
    
}
