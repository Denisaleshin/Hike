//
//  GradientButtonStule.swift
//  Hike
//
//  Created by Denis Aleshyn on 19/10/2023.
//

import Foundation
import SwiftUI

struct GradientButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal, 40)
            .background(
                // Condition statement with Nil Coalescing
                // Comdition ? A : B
                configuration.isPressed ?
                // A: When user pressed the button
                LinearGradient(colors: [
                    .customGrayMedium,
                    .customGrayLight
                ],
                               startPoint: .top,
                               endPoint: .bottom)
                :
        
                // B: When the button is not pressed
            LinearGradient(colors: [
                .customGrayLight,
                .customGrayMedium
            ],
                           startPoint: .top,
                           endPoint: .bottom)
            )
            .cornerRadius(40)
    }
}
