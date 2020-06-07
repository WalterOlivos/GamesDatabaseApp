//
//  Game.swift
//  TCC
//
//  Created by Walter Oliveira on 06/06/20.
//  Copyright © 2020 Walter Oliveira. All rights reserved.
//

import UIKit

struct GameModel {
    let id: Int
    let name: String
    let released: String
    let rating: Double
    let genres: [GenreModel]
    let tags: [TagModel]
    let platforms: [PlatformsModel]
    let imageURL: URL
    
    let description: String?
    
    var image: UIImage?
}

extension GameModel: Decodable {
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case description = "description"
        case released = "released"
        case rating = "rating"
        case imageURL = "background_image"
        case genres = "genres"
        case platforms = "platforms"
        case tags = "tags"
    }
}
