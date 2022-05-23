//
//  EMGameModel.swift
//  Emoji Match
//
//  Created by Munirathinam, Anish | RIEPL on 23/05/22.
//

import Foundation

struct EMGameModel<EMCardContent> {

    struct EMCard: Identifiable {
        let content: EMCardContent
        let id: Int
        var isFlipped = false
        var isMatched = false
    }

    private(set) var cards: [EMCard]

    init(pairs: Int, content: (Int) -> EMCardContent) {
        cards = [EMCard]()
        for pairIndex in 0..<pairs {
            let content = content(pairIndex)
            cards.append(EMCard(content: content, id: pairIndex*2))
            cards.append(EMCard(content: content, id: pairIndex*2+1))
        }
    }

    func choose(_ card: EMCard) {
        // TODO: Handle choosing and matching cards
    }
}
