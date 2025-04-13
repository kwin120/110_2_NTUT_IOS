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
    
    var emojiChoices = ["🤡", "😈", "👽", "🤖"]
    var emojiDict:Dictionary<Int, String> = [:]
    
    @IBAction func flip(_ sender: UIButton) {
        if let cardNumber = buttons.index(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
        flipCount += 1
    }
    
    func updateViewFromModel() {
        for index in buttons.indices{
            let button = buttons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(getEmoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1):#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            }
        }
    }
    
    func getEmoji(for card: Card) -> String {
        
        if emojiDict[card.identifier] == nil{
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emojiDict[card.identifier] = emojiChoices[randomIndex]
        }
        return emojiDict[card.identifier] ?? "?"
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    lazy var game:MatchingGame = MatchingGame(numberOfPairsOfCards: (buttons.count+1)/2)
    var flipCount = 0 {
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }

}

