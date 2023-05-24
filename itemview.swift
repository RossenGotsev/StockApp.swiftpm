//
//  itemview.swift
//  StockApp
//
//  Created by Adam Kubala on 5/24/23.
//
import SwiftUI

struct ItemView: View {
    let currentitem:ShoppingItem
    var body: some View {
     
            
            Text(currentitem.Name)
                .font(.largeTitle)
            Text("\(currentitem.Quantity)")
                .font(.title3)

    }
}



