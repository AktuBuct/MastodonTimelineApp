//
//  DateConverter.swift
//  MastodonTestApp
//
//  Created by AktuBuct on 22.03.2018.
//  Copyright © 2018 AktuBuct. All rights reserved.
//

import Foundation

@objcMembers
class DateConverter: NSObject {

    static func dateFrom(string dateString: String) -> Date? {

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.zzzZ"
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+0:00")
        return dateFormatter.date(from: dateString)
    }

    static func intervalStringFrom(date: Date) -> String? {

        let interval = -NSInteger(date.timeIntervalSinceNow)

        let seconds = interval % 60
        let minutes = (interval / 60) % 60
        let hours = (interval / 3600)

        if hours >= 1 {
            return "\(hours)h"
        } else if minutes >= 1 {
            return "\(minutes)m"
        } else if seconds >= 10 {
            return "\(seconds)s"
        } else {
            return "now"
        }
    }

}
