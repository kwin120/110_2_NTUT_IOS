//
//  Card.swift
//  flipcard
//
//  Created by student on 2022/3/23.
//  Copyright © 2022年 student. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier:Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier()->Int{
        identifierFactory += 1
        return identifierFactory
    }
    
    init(identifier i:Int){
        self.identifier = i
    }
}
