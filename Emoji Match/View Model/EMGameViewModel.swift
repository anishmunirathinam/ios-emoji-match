//
//  EMGameViewModel.swift
//  Emoji Match
//
//  Created by Munirathinam, Anish | RIEPL on 23/05/22.
//

import Foundation

class EMGameViewModel {

    typealias EMCard = EMGameModel<String>.EMCard
    static let content = ["❤️", "🧡", "💛", "💚", "💙", "💜", "🖤", "🤍", "🤎"]

    static func createModel() -> EMGameModel<String> {
        EMGameModel(pairs: content.count) {
            content[$0]
        }
    }

    private var model: EMGameModel = createModel()

    var cards: [EMCard] {
        model.cards
    }

    func choose(_ card: EMCard) {
        // TODO: Handle choosing and matching cards
    }
}
