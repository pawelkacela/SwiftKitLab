//
//  DefaultButton.swift
//  SwiftKitLab
//
//  Created by Pawel Kacela on 31/07/2026.
//

import SwiftUI

struct DefaultButton: View {
    
    private enum Constants {
        static let buttonWidth: CGFloat = 240.0
        static let buttonHeight: CGFloat = 40.0
    }
    
    var title: String
    var action: () -> Void
    
    public init(_ title: String,
                action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }
    
    public var body: some View {
        VStack {
            Button {
                action()
            } label: {
                
                Text(title)
                    .frame(
                        width: Constants.buttonWidth,
                        height: Constants.buttonHeight
                    )
                
            }
        }
    }
}
