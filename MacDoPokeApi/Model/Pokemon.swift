//
//  Pokemon.swift
//  MacDoPokeApi
//
//  Created by Service Informatique on 22/03/2021.
//  Copyright © 2021 MDS. All rights reserved.
//

import Foundation

class Pokemon {
    var name: String
    var detailUrl: String
    
    init(name: String, detailUrl: String) {
        self.name = name
        self.detailUrl = detailUrl
    }
}

