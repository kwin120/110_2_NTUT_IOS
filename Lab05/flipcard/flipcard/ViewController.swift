//
//  ViewController.swift
//  flipcard
//
//  Created by student on 2022/3/23.
//  Copyright © 2022年 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        for button in buttons {
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet var buttons: [UIButton]!
    
    var emojiChoices = ["🤡", "😈", "👽", "🤖", "🤠", "💀", "👻", "🎃"]
    var emojiDict = [Card:String]()
    
    @IBAction func flip(_ sender: UIButton) {
        if let cardNumber = buttons.index(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
        flipCountLabel.text = "Flips: \(game.flipCount)"
    }
    
    @IBAction func flipAll(_ sender: UIButton) {
        for index in game.cards.indices{
            game.cards[index].isFaceUp = !game.cards[index].isFaceUp
            updateViewFromModel()
            game.flipCount = 0
            flipCountLabel.text = "Flips: \(game.flipCount)"
        }
    }
    
    @IBAction func reset(_ sender: UIButton) {
        game = MatchingGame(numberOfPairsOfCards: numberOfPairsOfCard)
        updateViewFromModel()
    }
    
    func updateViewFromModel() {
        for index in buttons.indices{
            let button = buttons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(getEmoji(for: card), for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.9389395118, green: 0.3498239517, blue: 0.1933075488, alpha: 0.5):#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
            }
        }
    }
    
    func getEmoji(for card: Card) -> String {
        
        if emojiDict[card] == nil, emojiChoices.count>0{
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emojiDict[card] = emojiChoices.remove(at: randomIndex)
        }
        return emojiDict[card] ?? "?"
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    lazy var game:MatchingGame = MatchingGame(numberOfPairsOfCards: numberOfPairsOfCard)
    
    var numberOfPairsOfCard: Int{
        get{
            return (buttons.count+1)/2
        }
    }
    

}

