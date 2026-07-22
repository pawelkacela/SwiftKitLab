//
//  CategoriesViewModel.swift
//  SwiftKitLab
//
//  Created by Pawel Kacela on 29/06/2026.
//

import Foundation
import AppDomain

@MainActor
@Observable
final class CategoriesViewModel {
    
    var categories: [String] = []
    let service: CategoryService
    
    init(service: CategoryService
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
