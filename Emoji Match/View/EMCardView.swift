//
//  EMCardView.swift
//  Emoji Match
//
//  Created by Munirathinam, Anish | RIEPL on 22/05/22.
//

import SwiftUI

internal struct EMCardView: View {

    let card: EMGameViewModel.EMCard

    var body: some View {
        ZStack {
            let cardShape = RoundedRectangle(cornerRadius: EMCardViewConstants.kCornerRadius)
            if card.isFlipped {
                cardShape.fill().foregroundColor(.white)
                cardShape.strokeBorder(lineWidth: EMCardViewConstants.kLineWidth)
                Text(card.content).font(.largeTitle)
            } else {
                cardShape.fill()
            }
        }
    }
}

fileprivate struct EMCardViewConstants {

    static let kCornerRadius                = 10.0
    static let kLineWidth                   = 1.0
}

internal struct EMCardView_Previews: PreviewProvider {

    static var previews: some View {
        EMCardView(card: EMGameViewModel.EMCard(content: "❤️",
                                                id: 1000,
                                                isFlipped: false,
                                                isMatched: false)).padding()
    }
}
