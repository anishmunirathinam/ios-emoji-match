//
//  ContentView.swift
//  Emoji Match
//
//  Created by Munirathinam, Anish | RIEPL on 22/05/22.
//

import SwiftUI

struct EMGameView: View {

    let emojis = ["❤️", "💚", "💙", "🖤"]
    
    var body: some View {
        VStack {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100.0))]) {
                ForEach(emojis[0..<emojis.count], id: \.self) {
                    EMCardView(content: $0)
                        .aspectRatio(2/3, contentMode: .fit)
                }
            }
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EMGameView()
    }
}
