//
//  ViewController.swift
//  1_Flippping_Card_Game
//
//  Created by Fazle Rabbi Linkon on 2/6/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    lazy var game = FlippingCard(numberOfPairs: (self.cardButtons.count + 1 ) / 2)

    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }

    var emojiChoices = ["👻", "🎃", "🦷", "👀"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
//            flipcard(withEmoji: emojiChoices[cardNumber], on: sender)
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            print("cardNumber = \(cardNumber)")
        }
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            }
        }

    }
    
    var emoji = [Int: String]()
    
    func emoji(for card: Card) -> String {
        
        if emoji[card.identifier] == nil {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
        }
        return emoji[card.identifier] ?? "?"
    }

}

