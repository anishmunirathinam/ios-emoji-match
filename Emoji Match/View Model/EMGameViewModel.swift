//
//  EMGameViewModel.swift
//  Emoji Match
//
//  Created by Munirathinam, Anish | RIEPL on 23/05/22.
//

import Foundation

class EMGameViewModel: ObservableObject {

    typealias EMCard = EMGameModel<String>.EMCard
    static let content = ["❤️", "🧡", "💛", "💚", "💙", "💜", "🖤", "🤍", "🤎"]

    static func createModel() -> EMGameModel<String> {
        EMGameModel(pairs: content.count) {
            content[$0]
        }
    }

    @Published private var model: EMGameModel = createModel()

    var cards: [EMCard] {
        model.cards
    }

    func choose(_ card: EMCard) {
        model.choose(card)
    }
}
