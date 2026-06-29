//
//  CategoriesViewModel.swift
//  SwiftKitLab
//
//  Created by Pawel Kacela on 29/06/2026.
//

import Foundation
import Networking

@Observable
class CategoriesViewModel {
    
    var categories: [String] = []
    
    func fetchCategories() {
        // step 1
        let url = URL(string: "https://dummyjson.com/products/category-list")
        let request = URLRequest(url: url!)
        
        do {
//            let categories = try await APIClient.fetch(request: request, [String].self)
//            print("products: \(categories.count)")
        }
        catch {
            print(error)
        }
    }
    
}
