//
//  DiscountsViewModel.swift
//  app998
//
//  Created by Dias Atudinov on 15.10.2024.
//

import Foundation

class DiscountsViewModel: ObservableObject {
    
    @Published var discounts: [Discount] = [Discount(name: "", market: "", category: "", startDate: Date(), endDate: Date(), note: ""), Discount(name: "Discount 2 for the price of 1", market: "Domino's Pizza", category: "Food", startDate: Date(), endDate: Calendar.current.date(byAdding: .hour, value: 48, to: Date()) ?? Date(), note: "Buy two pizzas and get the second one for free asdsadasd sadsad")]
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
