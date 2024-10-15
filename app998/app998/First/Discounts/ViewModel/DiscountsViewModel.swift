//
//  DiscountsViewModel.swift
//  app998
//
//  Created by Dias Atudinov on 15.10.2024.
//

import Foundation

class DiscountsViewModel: ObservableObject {
    
    @Published var discounts: [Discount] = [Discount(name: "", market: "", category: "", startDate: Date(), endDate: Date(), note: "")]
    @Published var categories: [String] = [
        "Rock",
        "Pop",
        "Jazz",
        "Hip-Hop"
    ]
    
    @Published var selectedCategory: String?
    
    func filteredDiscounts() -> [Discount] {
        if let selectedCategory = selectedCategory {
            return discounts.filter { $0.category.lowercased() == selectedCategory.lowercased() }
        }
        return discounts
    }
}
