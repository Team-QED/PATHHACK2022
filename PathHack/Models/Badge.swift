//
//  Badge.swift
//  PathHack
//
//  Created by Lee on 2022/04/29.
//

import Foundation

struct Badge: Hashable {
    let inType: InType
    var currRecord: Int
    
    var level: Level {
        switch self.currRecord {
        case 0...100:
            return .bronze
        case 101...400:
            return .silver
        default:
            return .gold
        }
    }
    
    var record: Int {
        switch self.level {
        case .gold:
            return currRecord - 400
        case .silver:
            return currRecord - 100
        case.bronze:
            return currRecord
        }
    }
    
    var imageName: String {
        inType.rawValue + "_" + level.rawValue
    }
    
    var percent: Double {
        Double(record) / Double(level.value)
    }
    
    var percentStr: String {
        String(record) + " / " + String(level.value)
    }
     
    enum Level: String {
        case bronze
        case silver
        case gold
        
        var value: Int {
            switch self {
            case .bronze:
                return 100
            case .silver:
                return 300
            case .gold:
                return 500
            }
        }
        
        var sum: Int {
            switch self {
            case .bronze:
                return 100
            case .silver:
                return 400
            case .gold:
                return 900
            }
        }
    }
    
    enum InType: String, CaseIterable {
        case book
        case running
        case movie
        case coding
        case cook
        case bicycle
        case pathfinder
        
        var name: String {
            switch self {
            case .book:
                return "독서"
            case .running:
                return "러닝"
            case .movie:
                return "영화"
            case .coding:
                return "코딩"
            case .cook:
                return "요리"
            case .bicycle:
                return "자전거"
            case .pathfinder:
                return "패스파인더"
            }
        }
    }
}


var badgeData: [Badge] = [
    Badge(inType: .book, currRecord: 500),
    Badge(inType: .running, currRecord: 200),
    Badge(inType: .movie, currRecord: 10),
    Badge(inType: .coding, currRecord: 398),
    Badge(inType: .cook, currRecord: 5),
    Badge(inType: .bicycle, currRecord: 300),
]
