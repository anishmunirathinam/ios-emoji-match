//
//  EMCardView.swift
//  Emoji Match
//
//  Created by Munirathinam, Anish | RIEPL on 22/05/22.
//

import SwiftUI

internal struct EMCardView: View {

    @State var isFlipped = false
    var content: String
    
    var body: some View {
        ZStack {
            let cardShape = RoundedRectangle(cornerRadius: EMCardViewConstants.kCornerRadius)
            if isFlipped {
                cardShape.fill().foregroundColor(.white)
                cardShape.strokeBorder(lineWidth: EMCardViewConstants.kLineWidth)
                Text(content).font(.largeTitle)
            } else {
                cardShape.fill()
            }
        }
        .onTapGesture {
            isFlipped = !isFlipped
        }
    }
}

fileprivate struct EMCardViewConstants {

    static let kCornerRadius                = 10.0
    static let kLineWidth                   = 1.0
}

internal struct EMCardView_Previews: PreviewProvider {

    static var previews: some View {
        EMCardView(content: "🤎").padding()
    }
}
