//
//  FlippingCardModel.swift
//  1_Flippping_Card_Game
//
//  Created by Fazle Rabbi Linkon on 2/6/21.
//

import Foundation

struct FlippingCard {

    private(set) var cards = [Card]()

    private var indexOfOneAndObnlyFaceUpCard: Int? {
        get {
            return cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly
        } set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }

    mutating func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "FlippingCard.chooseCard(at: \(index): chosen index not in the cards")
        if !cards[index].isMatched {

            if let matchIndex = indexOfOneAndObnlyFaceUpCard, matchIndex != index {
                // check if cards match
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }

                cards[index].isFaceUp = true
            } else {
                // either no cards or 2 cards are face up
                indexOfOneAndObnlyFaceUpCard = index
            }

        }
    }

    init(numberOfPairs: Int) {
        assert(numberOfPairs > 0, "FlippingCard.chooseCard(at: \(numberOfPairs): you must have at least one pair of cards.")
        for _ in 1...numberOfPairs {
            let card = Card()
            cards += [card, card]
        }
        cards.shuffle()
    }
}


// MARK: Collection Extension

extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}
