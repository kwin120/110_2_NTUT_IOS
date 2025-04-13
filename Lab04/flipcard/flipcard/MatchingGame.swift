//
//  MatchingGame.swift
//  flipcard
//
//  Created by student on 2022/3/23.
//  Copyright © 2022年 student. All rights reserved.
//

import Foundation

class MatchingGame {
    var cards: Array<Card> = Array()
    var indexofFirstFaceUpCard: Int? = nil
    
    func chooseCard(at index: Int){
        if !cards[index].isMatched{
            if let matchIndex = indexofFirstFaceUpCard, matchIndex != index{
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexofFirstFaceUpCard = nil
            }else if let matchIndex = indexofFirstFaceUpCard, matchIndex == index{
                cards[index].isFaceUp = false
                indexofFirstFaceUpCard = nil
            }else{
            for flipDownIndex in cards.indices{
                if !cards[flipDownIndex].isMatched{
                    cards[flipDownIndex].isFaceUp = false
                }
            }
            cards[index].isFaceUp = true
            indexofFirstFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for i in 1...numberOfPairsOfCards{
            let card = Card(identifier: i)
            cards += [card, card]
        }
    }
}
