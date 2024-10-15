//
//  Discount.swift
//  app998
//
//  Created by Dias Atudinov on 15.10.2024.
//

import Foundation

struct Discount: Hashable, Codable {
    var id = UUID()
    var name: String
    var market: String
    var category: String
    var startDate: Date
    var endDate: Date
    var note: String
    
    var isArchive: Bool {
        get {
            let currentDate = Date()
            let calendar = Calendar.current
            let orderDateTime = calendar.date(bySettingHour: calendar.component(.hour, from: endDate),
                                              minute: calendar.component(.minute, from: endDate),
                                              second: 0, of: endDate) ?? endDate
            return orderDateTime < currentDate
        }
    }
}

struct Category: Identifiable, Hashable {
    var id = UUID()
    var name: String
}
