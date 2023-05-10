//
//  searchView.swift
//  StockApp
//
//  Created by Rossen Gotsev on 5/10/23.
//

import Foundation
class Search: ObservableObject{
    @Published var search : String
    
    init(){
        search = "IBM"
        
    }
    
}
