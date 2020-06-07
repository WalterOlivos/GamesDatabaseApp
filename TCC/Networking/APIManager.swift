//
//  APIManager.swift
//  TCC
//
//  Created by Walter Oliveira on 06/06/20.
//  Copyright © 2020 Walter Oliveira. All rights reserved.
//

import Foundation

struct APIManager {
    
    static let gamesListURL = URL(string: "https://api.rawg.io/api/games")!
    
    static let defaultError: String = "Ocorreu um problema, tente novamente."
    
}
