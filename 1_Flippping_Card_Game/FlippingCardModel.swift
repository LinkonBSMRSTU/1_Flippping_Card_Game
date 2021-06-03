//
//  FlippingCardModel.swift
//  1_Flippping_Card_Game
//
//  Created by Fazle Rabbi Linkon on 2/6/21.
//

import Foundation

class FlippingCard {

    var cards = [Card]()

    var indexOfOneAndObnlyFaceUpCard: Int?

    func chooseCard(at index: Int) {

        if !cards[index].isMatched {

            if let matchIndex = indexOfOneAndObnlyFaceUpCard, matchIndex != index {
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }

                cards[index].isFaceUp = true
                indexOfOneAndObnlyFaceUpCard = nil
            } else {
                // either no cards or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndObnlyFaceUpCard = index
            }

        }
    }

    init(numberOfPairs: Int) {
        for _ in 1...numberOfPairs {
            let card = Card()
            cards += [card, card]
        }
    }

    // TODO: Shuffle the cards.
}
