//
//  TagModel.swift
//  TCC
//
//  Created by Walter Oliveira on 06/06/20.
//  Copyright © 2020 Walter Oliveira. All rights reserved.
//

import Foundation

struct TagModel {
    let id: Int
    let name: String
}

extension TagModel: Decodable {
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
}
