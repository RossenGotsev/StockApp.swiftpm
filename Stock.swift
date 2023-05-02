//
//  Stock.swift
//  StockApp
//
//  Created by Sebastian Brzosko on 4/28/23.
//

import SwiftUI
struct Stock: Identifiable {
    let id = UUID()
    let symbol: String
    let price: Double
}
