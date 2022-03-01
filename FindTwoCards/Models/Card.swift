//
//  Card.swift
//  FindTwoCards
//
//  Created by Андрей Евдокимов on 01.03.2022.
//

class Card {
    
    let emoji: String
    let pairId: Int
    let color: [String: Int]

    init (emoji: String, pairId: Int, color: [String: Int]) {
        self.emoji = emoji
        self.pairId = pairId
        self.color = color
    }
}
