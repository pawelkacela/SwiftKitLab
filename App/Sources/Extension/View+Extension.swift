//
//  View+Extension.swift
//  SwiftKitLab
//
//  Created by Pawel Kacela on 01/07/2026.
//
import SwiftUI

extension View {
    
    func onTriggerLoadAt(triggerDistance: CGFloat,
                         of transform: @escaping () -> Void) -> some View {
        
        return self
            .onScrollGeometryChange(for: Bool.self) { geometry in
                
                let maxOffset: CGFloat = geometry.contentSize.height - geometry.containerSize.height
                let currentOffset: CGFloat = geometry.contentOffset.y
                return currentOffset >= maxOffset - triggerDistance
                
            } action: { wasNearBottom, isNearBottom in
                
                guard isNearBottom && !wasNearBottom else { return }
                transform()
            }
    }
    
}
