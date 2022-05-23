//
//  EMAspectVGrid.swift
//  Emoji Match
//
//  Created by Munirathinam, Anish | RIEPL on 23/05/22.
//

import SwiftUI

struct EMAspectVGrid<EMItem: Identifiable, EMItemView: View>: View {

    let items: [EMItem]
    let aspectRatio: CGFloat
    let content: (EMItem) -> EMItemView

    var body: some View {
        GeometryReader { geometry in
            VStack {
                let width = width(for: items.count, in: geometry.size, with: aspectRatio)
                LazyVGrid(columns: [GridItem(.adaptive(minimum: width), spacing: 0)], spacing: 0) {
                    ForEach(items) {
                        content($0)
                            .aspectRatio(aspectRatio, contentMode: .fit)
                    }
                }
                Spacer(minLength: 0)
            }
        }
    }

    private func width(for itemCount: Int, in size: CGSize, with aspectRatio: CGFloat) -> CGFloat {
        var columnCount = 1
        var rowCount = itemCount
        repeat {
            let itemWidth = size.width / CGFloat(columnCount)
            let itemHeight = itemWidth / aspectRatio
            if CGFloat(rowCount) * itemHeight < size.height {
                break
            }
            columnCount += 1
            rowCount = (itemCount + (columnCount - 1)) / columnCount
        } while columnCount < itemCount
        if columnCount > itemCount {
            columnCount = itemCount
        }
        return floor(size.width/CGFloat(columnCount))
    }
}

struct EMAspectVGrid_Previews: PreviewProvider {
    static var previews: some View {
        let items = [EMGameViewModel.EMCard(content: "🥶", id: 1001, isFlipped: true, isMatched: false),
                     EMGameViewModel.EMCard(content: "😶‍🌫️", id: 1002, isFlipped: true, isMatched: false)]
        EMAspectVGrid(items: items, aspectRatio: 2/3) { card in
            EMCardView(card: card)
                .padding(4)
                .foregroundColor(.green)
        }
    }
}
