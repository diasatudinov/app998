//
//  DashboardViewModel.swift
//  app998
//
//  Created by Dias Atudinov on 15.10.2024.
//

import Foundation

class DashboardViewModel: ObservableObject {
    
    @Published var data: Dashboard = Dashboard(saved: 0, market: "Empty", categoryOne: "Not category", valueOne: 0, categoryTwo: "Not category", valueTwo: 0)
    
    
    func editData(_ saved: Double, market: String, categoryOne: String, valueOne: Double, categoryTwo: String, valueTwo: Double) {
        data.saved = saved
        data.market = market
        data.categoryOne = categoryOne
        data.valueOne = valueOne
        data.categoryTwo = categoryTwo
        data.valueTwo = valueTwo
    }
}
 
