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
            EMCardView(card: card)
                .padding(4)
                .onTapGesture {
                    game.choose(card)
                }
        }
        .foregroundColor(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EMGameView()
    }
}
