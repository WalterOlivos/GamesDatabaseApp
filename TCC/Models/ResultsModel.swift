//
//  ResultsModel.swift
//  TCC
//
//  Created by Walter Oliveira on 06/06/20.
//  Copyright © 2020 Walter Oliveira. All rights reserved.
//

import Foundation

struct ResultModel {
    var games: [GameModel]
}

extension ResultModel: Decodable {
    enum CodingKeys: String, CodingKey {
        case games = "results"
    }
}
