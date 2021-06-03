//
//  FlippingCardModel.swift
//  1_Flippping_Card_Game
//
//  Created by Fazle Rabbi Linkon on 2/6/21.
//

import Foundation

class FlippingCard {

    var cards = [Card]()

    func chooseCard(at index: Int) {
        if cards[index].isFaceUp {
            cards[index].isFaceUp = false
        } else {
            cards[index].isFaceUp = true
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
