//
//  ContentView.swift
//  Emoji Match
//
//  Created by Munirathinam, Anish | RIEPL on 22/05/22.
//

import SwiftUI

struct EMGameView: View {

    @ObservedObject var game = EMGameViewModel()
    
    var body: some View {
        EMAspectVGrid(items: game.cards, aspectRatio: 2/3) { card in
            show(card)
        }
        .foregroundColor(.red)
    }

    @ViewBuilder
    private func show(_ card: EMGameViewModel.EMCard) -> some View {
        if card.isMatched && !card.isFlipped {
            Rectangle().opacity(0.0)
        } else {
            EMCardView(card: card)
                .padding(4)
                .onTapGesture {
                    game.choose(card)
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EMGameView()
    }
}
