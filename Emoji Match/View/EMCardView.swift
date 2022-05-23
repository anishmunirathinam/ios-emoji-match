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
        GeometryReader { geometry in
            ZStack {
                EMPie(startAngle: Angle(degrees: 0-90), endAngel: Angle(degrees: 30-90))
                    .opacity(0.5)
                Text(card.content).font(scaledFont(for: geometry.size))
            }
            .cardify(isFlipped: card.isFlipped)
        }
    }

    private func scaledFont(for size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * EMCardViewConstants.kFontScaleFactor)
    }
}

fileprivate struct EMCardViewConstants {

    static let kCornerRadius                = 10.0
    static let kLineWidth                   = 1.0
    static let kFontScaleFactor             = 0.5
}

internal struct EMCardView_Previews: PreviewProvider {

    static var previews: some View {
        EMCardView(card: EMGameViewModel.EMCard(content: "❤️",
                                                id: 1000,
                                                isFlipped: false,
                                                isMatched: false))
        .padding()
        .foregroundColor(.blue)
    }
}
