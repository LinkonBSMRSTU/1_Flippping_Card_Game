//
//  Card.swift
//  1_Flippping_Card_Game
//
//  Created by Fazle Rabbi Linkon on 2/6/21.
//

import Foundation

struct Card: Hashable {
    
    var hashValue: Int { return identifier }

    var isFaceUp = false
    var isMatched = false
    private var identifier: Int
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }

    private static var identifierFactory = 0

    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return Card.identifierFactory
    }

    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
