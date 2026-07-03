//
//  Router.swift
//  SwiftKitLab
//
//  Created by Pawel Kacela on 03/07/2026.
//

import Foundation
import SwiftUI


// consider mainActor?
@Observable
class Router: Routing {
    
    var path = NavigationPath()
    
    func push(_ route: Route) {
        path.append(route)
    }
    
    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
    
    func pop(count: Int) {
        guard !path.isEmpty else { return }
        path.removeLast(min(count, path.count))
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    // Replace entire stack (useful after login, etc.)
    func replace(with routes: [Route]) {
        path = NavigationPath(routes)
    }
    
}


