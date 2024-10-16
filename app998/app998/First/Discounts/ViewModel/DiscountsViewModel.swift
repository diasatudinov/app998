//
//  DiscountsViewModel.swift
//  app998
//
//  Created by Dias Atudinov on 15.10.2024.
//

import Foundation

class DiscountsViewModel: ObservableObject {
    
    @Published var discounts: [Discount] = []{
        didSet {
            saveDiscount()
        }
    }
    
    @Published var categories: [String] = [] {
        didSet {
            saveCategory()
        }
    }
    
    private let fileNameCategory = "Category.json"
    private let fileNameDiscount = "Discount.json"
    
    init() {
        loadCategory()
        loadDiscount()
    }
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    private func filePathCategory() -> URL {
        return getDocumentsDirectory().appendingPathComponent(fileNameCategory)
    }
    
    private func filePathDiscount() -> URL {
        return getDocumentsDirectory().appendingPathComponent(fileNameDiscount)
    }
   
    
    private func saveCategory() {
        DispatchQueue.global().async {
            let encoder = JSONEncoder()
            do {
                let data = try encoder.encode(self.categories)
                try data.write(to: self.filePathCategory())
            } catch {
                print("Failed to save players: \(error.localizedDescription)")
            }
        }
    }
    
    private func saveDiscount() {
        DispatchQueue.global().async {
            let encoder = JSONEncoder()
            do {
                let data = try encoder.encode(self.discounts)
                try data.write(to: self.filePathDiscount())
            } catch {
                print("Failed to save players: \(error.localizedDescription)")
            }
        }
    }
    
    private func loadDiscount() {
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: filePathDiscount())
            self.discounts = try decoder.decode([Discount].self, from: data)
        } catch {
            print("Failed to load players: \(error.localizedDescription)")
        }
    }
    
    private func loadCategory() {
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: filePathCategory())
            self.categories = try decoder.decode([String].self, from: data)
        } catch {
            print("Failed to load players: \(error.localizedDescription)")
        }
    }
    @Published var selectedCategory: String?
    
    func filteredDiscounts() -> [Discount] {
        if let selectedCategory = selectedCategory {
            return discounts.filter { $0.category.lowercased() == selectedCategory.lowercased() }
        }
        return discounts
    }
    
    func addDiscount(_ discount: Discount) {
        discounts.append(discount)
    }
    
    func deleteDiscount(_ discount: Discount) {
        if let index = discounts.firstIndex(where: { $0.id == discount.id }) {
            discounts.remove(at: index)
        }
    }
    
    func editDiscount(_ discount: Discount, name: String, market: String, category: String, startDate: Date, endDate: Date, note: String) {
        if let index = discounts.firstIndex(where: { $0.id == discount.id }) {
            discounts[index].name = name
            discounts[index].market = market
            discounts[index].category = category
            discounts[index].startDate = startDate
            discounts[index].endDate = endDate
            discounts[index].note = note
        }
    }
}

