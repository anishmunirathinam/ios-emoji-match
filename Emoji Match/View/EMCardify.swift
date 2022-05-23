//
//  EMCardify.swift
//  Emoji Match
//
//  Created by Munirathinam, Anish | RIEPL on 23/05/22.
//

import SwiftUI

struct EMCardify: ViewModifier {

    var isFlipped: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            let cardShape = RoundedRectangle(cornerRadius: EMCardifyConstants.kCornerRadius)
            if isFlipped {
                cardShape.fill().foregroundColor(.white)
                cardShape.strokeBorder(lineWidth: EMCardifyConstants.kLineWidth)
                content
            } else {
                cardShape.fill()
            }
        }
    }

    fileprivate struct EMCardifyConstants {

        static let kCornerRadius                = 10.0
        static let kLineWidth                   = 1.0
    }
}

extension View {

    func cardify(isFlipped: Bool) -> some View {
        self.modifier(EMCardify(isFlipped: isFlipped))
    }
}
