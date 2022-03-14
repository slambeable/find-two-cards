//
//  Card.swift
//  FindTwoCards
//
//  Created by Андрей Евдокимов on 01.03.2022.
//

class Card {
    let emoji: String
    let pairId: Int
    
    var isFacedUp = false
    var isMatched = false
    
    init(emoji: String, pairId: Int) {
        self.emoji = emoji
        self.pairId = pairId
    }
}
