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
    let service: CategoryService
    
    init(service: CategoryService = DefaultCategoryService()
    ) {
        self.service = service
    }
    
    func fetchCategories() async {
        do {
            categories = try await service.fetch()
        } catch {
            print(error)
        }
    }
    
}
