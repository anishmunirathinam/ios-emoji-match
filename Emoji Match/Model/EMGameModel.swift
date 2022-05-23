//
//  EMGameModel.swift
//  Emoji Match
//
//  Created by Munirathinam, Anish | RIEPL on 23/05/22.
//

import Foundation

struct EMGameModel<EMCardContent: Equatable> {

    struct EMCard: Identifiable {
        let content: EMCardContent
        let id: Int
        var isFlipped = false
        var isMatched = false
    }

    private(set) var cards: [EMCard]
    private var initialFlippedCardIndex: Int?

    init(pairs: Int, content: (Int) -> EMCardContent) {
        cards = [EMCard]()
        for pairIndex in 0..<pairs {
            let content = content(pairIndex)
            cards.append(EMCard(content: content, id: pairIndex*2))
            cards.append(EMCard(content: content, id: pairIndex*2+1))
        }
    }

    mutating func choose(_ card: EMCard) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[chosenIndex].isFlipped,
           !cards[chosenIndex].isMatched {
            if let matchIndex = initialFlippedCardIndex {
                if cards[chosenIndex].content == cards[matchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[matchIndex].isMatched = true
                }
                initialFlippedCardIndex = nil
            } else {
                cards.indices.forEach {
                    cards[$0].isFlipped = false
                }
                initialFlippedCardIndex = chosenIndex
            }
            cards[chosenIndex].isFlipped.toggle()
        }
    }
}
