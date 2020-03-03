//
//  Extensions.swift
//  WeatherLogger
//
//  Created by ALI NAVEED on 02/03/2020.
//  Copyright © 2020 Personal   Ltd. All rights reserved.
//

import Foundation

extension Date {
    func format() -> String? {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "MMM d, h:mm a"
        return dateFormat.string(from: self)
    }
}
