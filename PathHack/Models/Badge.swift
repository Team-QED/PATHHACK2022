//
//  Badge.swift
//  PathHack
//
//  Created by Lee on 2022/04/29.
//

import Foundation

struct Badge: Hashable {
    let name: String
    let level: Level
    let currRecord: Double
    let imageName: String
    var percent: Double {
        currRecord / level.rawValue
    }
     
    enum Level: Double {
        case beginning = 100
        case intermediate = 300
        case exclusive = 500
    }
}
