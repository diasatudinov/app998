//
//  DashboardViewModel.swift
//  app998
//
//  Created by Dias Atudinov on 15.10.2024.
//

import Foundation

class DashboardViewModel: ObservableObject {
    
    @Published var data: Dashboard = Dashboard(saved: 0, market: "Empty", categoryOne: "Not category", valueOne: 0, categoryTwo: "Not category", valueTwo: 0) {
        didSet {
            save()
        }
    }
    
    private let fileName = "data.json"
    
    init() {
        load()
    }
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    private func filePath() -> URL {
        return getDocumentsDirectory().appendingPathComponent(fileName)
    }
    
   
    
    private func save() {
        DispatchQueue.global().async {
            let encoder = JSONEncoder()
            do {
                let data = try encoder.encode(self.data)
                try data.write(to: self.filePath())
            } catch {
                print("Failed to save players: \(error.localizedDescription)")
            }
        }
    }
    
    
    private func load() {
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: filePath())
            self.data = try decoder.decode(Dashboard.self, from: data)
        } catch {
            print("Failed to load players: \(error.localizedDescription)")
        }
    }
    
    
    func editData(_ saved: Double, market: String, categoryOne: String, valueOne: Double, categoryTwo: String, valueTwo: Double) {
        data.saved = saved
        data.market = market
        data.categoryOne = categoryOne
        data.valueOne = valueOne
        data.categoryTwo = categoryTwo
        data.valueTwo = valueTwo
    }
}
 
