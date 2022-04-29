//
//  Date+Extensions.swift
//  PathHack
//
//  Created by 조현철 on 2022/04/30.
//

import Foundation

extension Date {
    func daysBetweenDate(toDate: Date) -> String {
        let components = Calendar.current.dateComponents([.second], from: self, to: toDate)
        let absSecond = abs(components.second ?? 0)
        
        if absSecond < 86400 {
            return "어제"
        } else {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "M/dd"
            dateFormatter.locale = Locale(identifier: "ko_KR")
            return dateFormatter.string(from: toDate)
        }
    }
}
