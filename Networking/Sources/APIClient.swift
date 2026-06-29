//
//  APIClient.swift
//  Networking
//
//  Created by Pawel Kacela on 29/06/2026.
//

import Foundation

public struct APIClient: Sendable {
    
    public init() { }
    
    public func fetch<T: Decodable>(request: URLRequest, _ type: T.Type) async throws -> T {
        
        let data: Data
        let response: URLResponse
        
        do {
            (data, response) = try await URLSession.shared.data(for: request)
        } catch let error as URLError where error.code == .cancelled {
            throw ApiError.taskCancellation
        } catch is CancellationError {
            throw ApiError.taskCancellation
        } catch {
            throw ApiError.networkError(error)
        }
        
        // step 2
        guard let httpResponse = response as? HTTPURLResponse else {
            print ("unknown response")
            throw ApiError.invalidResponse
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            print("error \(httpResponse.statusCode)")
            
            let serverError = try JSONDecoder().decode(ServerError.self, from: data)
            throw ApiError.requestFailed(statusCode: httpResponse.statusCode, message: serverError.message)
            
            // 404 - doest not exist
            // 401 - auth problems
            // 429 - rate limited
            // 500...599 server errors
        }
        
        // step 3
//        return try JSONDecoder().decode(type, from: data)
        #warning("this should prevent runing decoding on main thread, but consider using commented out line instead")
        
        return try await Task.detached {
            try JSONDecoder().decode(type, from: data)
        }.value
        
    }
    
}
