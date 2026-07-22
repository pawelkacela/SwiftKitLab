//
//  Routing.swift
//  SwiftKitLab
//
//  Created by Pawel Kacela on 03/07/2026.
//

import SwiftUI

@MainActor
protocol Routing {
    
    var path: NavigationPath { get }
    
    func push(_ route: Route)
    
    func pop()
    
    func pop(count: Int)
    
    func popToRoot()
    
    // Replace entire stack (useful after login, etc.)
    func replace(with routes: [Route])
}
