//
//  Record.swift
//  PathHack
//
//  Created by 조현철 on 2022/04/30.
//

import Foundation

struct Record {
    let date: String
    let inTypes: [InTypeDetail]
}

struct InTypeDetail {
    let inType: Badge.InType
    let point: Int
    var imageName: String {
        inType.rawValue + "_bronze"
    }
}

let recordData = [
    Record(date: "2022-04-30", inTypes: [
        InTypeDetail(inType: .bicycle, point: 5),
        InTypeDetail(inType: .book, point: 8),
        InTypeDetail(inType: .running, point: 2)
    ]),
    Record(date: "2022-04-29", inTypes: [
        InTypeDetail(inType: .bicycle, point: 2),
        InTypeDetail(inType: .book, point: 1),
        InTypeDetail(inType: .running, point: 5)
    ]),
    Record(date: "2022-04-28", inTypes: [
        InTypeDetail(inType: .bicycle, point: 4),
        InTypeDetail(inType: .book, point: 2),
        InTypeDetail(inType: .running, point: 1)
    ]),
    Record(date: "2022-04-27", inTypes: [
        InTypeDetail(inType: .bicycle, point: 6),
        InTypeDetail(inType: .book, point: 7),
        InTypeDetail(inType: .running, point: 4)
    ]),
    Record(date: "2022-04-26", inTypes: [
        InTypeDetail(inType: .bicycle, point: 3),
        InTypeDetail(inType: .book, point: 2),
        InTypeDetail(inType: .running, point: 1)
    ])
]
