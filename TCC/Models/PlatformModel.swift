//
//  PlatformModel.swift
//  TCC
//
//  Created by Walter Oliveira on 06/06/20.
//  Copyright © 2020 Walter Oliveira. All rights reserved.
//

import Foundation

struct PlatformsModel {
    let platform: PlatformModel
}

extension PlatformsModel: Decodable {
    enum CodingKeys: String, CodingKey {
        case platform = "platform"
    }
}

struct PlatformModel {
    let id: Int
    let name: String
}

extension PlatformModel: Decodable {
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
}
